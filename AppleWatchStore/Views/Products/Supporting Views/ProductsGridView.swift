//
//  ProductsGridView.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 25.10.2023.
//

import SwiftData
import SwiftUI

struct ProductsGridView: View {
    @Query private var products: [Product]
    
    var body: some View {
        VStack {
            LazyVGrid(columns: Constants.columns, spacing: 16) {
                ForEach(products) { product in
                    NavigationLink {
                        ProductDetailView(product: product)
                    } label: {
                        GridProductItem(product: product)
                    }
                .buttonStyle(.plain)
                }
            }
        }
        .padding(2)
    }
}

//#Preview {
//    NavigationStack {
//        ProductsGridView()
//    }
//}
