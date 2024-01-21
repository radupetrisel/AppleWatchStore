//
//  FavoritesView.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 20.10.2023.
//

import SwiftData
import SwiftUI

struct FavoritesView: View {
    @Query(filter: #Predicate<Product> { $0.isFavourite })
    private var favoriteProducts: [Product]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 70) {
                    ForEach(favoriteProducts) { product in
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
            .background(.baseBackground)
            .navigationTitle("MY FAVORITES")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    FavoritesView()
}
