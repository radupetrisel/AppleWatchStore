//
//  ProductsListView.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 21.01.2024.
//

import SwiftData
import SwiftUI

struct ProductsListView: View {
    @Environment(ProductsFilter.self) var productsFilter
    @Query private var products: [Product]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 60) {
                ForEach(productsFilter.filterProducts(products: products)) { product in
                    NavigationLink {
                        ProductDetailView(product: product)
                    } label: {
                        WideProductItem(product: product)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.top, 60)
        }
    }
}

#Preview {
    ProductsListView()
}
