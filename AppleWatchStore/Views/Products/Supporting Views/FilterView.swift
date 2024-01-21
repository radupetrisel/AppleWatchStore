//
//  FilterView.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 25.10.2023.
//

import SwiftData
import SwiftUI

struct FilterView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(ProductsFilter.self) var productsFilter
    @Query private var productFilters: [ProductFilter]
    
    @State private var sections: [[ProductFilter]] = []
    
    private let categories = ["material", "finish", "band"]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                content
            }
            .background(.baseBackground)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    closeButton
                }
            }
            .navigationTitle("PRODUCT FILTERS")
            .onAppear {
                categories
                    .map { category in productFilters.filter { $0.category == category } }
                    .forEach { sections.append($0) }
                
                productsFilter.fetchSaved(filters: productFilters)
            }
            .safeAreaInset(edge: .bottom) {
                filterStatus
            }
        }
    }
    
    var content: some View {
        VStack(spacing: 50) {
            ForEach($sections, id: \.self) { $section in
                FilterSectionView(items: $section)
            }
        }
        .padding(.top, 20)
    }
    
    var filterStatus: some View {
        ZStack {
            Rectangle()
                .fill(.white.opacity(0.2))
                .frame(height: 125)
                .background(.ultraThinMaterial, in: Rectangle())
            
            Button { 
              dismiss()
            } label: {
                Text("FILTER (^[\(productsFilter.filterCount) ITEM](inflect: true))")
                    .condensedLowercased(.medium, size: 24)
                    .foregroundStyle(.white)
            }
            .buttonStyle(.customBorderedBlack)
            .padding(.horizontal, 20)
        }
        .offset(y: 32)
        .frame(height: 125)
    }
    
    var closeButton: some View {
        Button {
            dismiss()
        } label: {
            Text("Close")
                .foregroundStyle(.primary)
                .condensed(.bold, size: 18)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    FilterView()
}
