//
//  ProductsView.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 20.10.2023.
//

import SwiftUI
import TipKit

struct ProductsView: View {
    @State private var layout: ProductLayout = .list
    @State private var sheet: Sheet.SheetType?
    
    private var layoutTip = ProductLayoutTip()
    private var filterTip = ProductFilterTip()
    
    var body: some View {
        NavigationStack {
            TipView(layoutTip, action: actionHandler)
                .padding()
            content
                .navigationTitle("Apple Watches")
                .navigationBarTitleDisplayMode(.large)
                .toolbar { toolbarContent() }
                .fullScreenCover(item: $sheet, content: Sheet.init(sheetType:))
        }
    }
    
    var content: some View {
        Group {
            if layout == .grid {
                ProductsGridView()
            } else {
                ProductsListView()
            }
        }
    }
    
    func actionHandler(action: Tip.Action) {
        if action.id == "next-button" {
            Task {
                layoutTip.invalidate(reason: .tipClosed)
                await ProductFilterTip.productSteps.donate()
            }
        }
    }
}

extension ProductsView {
    @ToolbarContentBuilder
    func toolbarContent() -> some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            Button {
                sheet = .filter
            } label: {
                Image(systemName: "slider.horizontal.3")
            }
            .buttonStyle(.plain)
            .fontWeight(.semibold)
            .popoverTip(filterTip, arrowEdge: .top) { action in
                if action.id == "action.title.dismiss" {
                    filterTip.invalidate(reason: .tipClosed)
                }
            }
        }
        
        ToolbarItem(placement: .topBarTrailing) {
            Menu {
                Picker("Layout", selection: $layout) {
                    ForEach(ProductLayout.allCases) { option in
                        if option != .none {
                            Label(option.title, systemImage: option.image)
                                .tag(option)
                        }
                    }
                }
                .pickerStyle(.inline)
            } label: {
                Label("Layout options", systemImage: layout.image)
                    .symbolVariant(.fill)
                    .labelStyle(.iconOnly)
            }
        }
    }
}

#Preview {
    ProductsView()
}
