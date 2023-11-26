//
//  PopularSection.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 20.10.2023.
//

import SwiftData
import SwiftUI

struct PopularSection: View {
    @Query(filter: #Predicate<Product> { $0.isFeatured })
    private var popularProducts: [Product]
    
    var body: some View {
        VStack {
            SectionHeader(title: "Popular", icon: "slider.horizontal.3")
                .padding(.horizontal)
            
            LazyVGrid(columns: Constants.columns, spacing: 20) {
                ForEach(popularProducts) { product in
                    NavigationLink {
                        ProductDetailDescriptionView()
                    } label: {
                        GridProductItem(product: product)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        PopularSection()
    }
}
