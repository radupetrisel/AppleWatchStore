//
//  ProductDetailDescriptionView.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 04.11.2023.
//

import SwiftUI

struct ProductDetailDescriptionView: View {
    let product: Product
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(product.detailTitle)
                    .condensed(.bold, size: 34)
                    .lineLimit(2)
                
                HStack(alignment: .center) {
                    Image(systemName: "star")
                        .font(.system(size: 16))
                        .symbolVariant(.fill)
                        .foregroundStyle(.baseGold)
                    
                    Text(String(format: product.reviews.count > 0 ? "%.2f" : "0.0", product.ratingAverage))
                        .condensed(.bold, size: 22)
                    
                    Button(action: {}) {
                        Text("(^[\(product.reviews.count) Review](inflex: true))")
                            .condensed(.light, size: 16)
                    }
                    
                    Spacer()
                    
                    NavigationLink {
                        AddProductReview(product: product)
                    } label: {
                        Text("Add review".uppercased())
                            .condensed(.light, size: 16)
                    }
                    .buttonStyle(.plain)
                }
                .padding(.bottom, 5)
                
                Text(product.desc)
                    .condensed(.light, size: 16)
            }
        }
    }
}

#Preview {
    ProductDetailDescriptionView(product: .default)
}
