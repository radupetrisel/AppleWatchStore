//
//  FilterView.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 25.10.2023.
//

import SwiftData
import SwiftUI

struct FilterView: View {
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
            .navigationTitle("Product filters")
            .onAppear {
                categories
                    .map { category in productFilters.filter { $0.category == category } }
                    .forEach { sections.append($0) }
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
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Text("Filter (0 ITEMS)")
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
        Button(action: {}) {
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
