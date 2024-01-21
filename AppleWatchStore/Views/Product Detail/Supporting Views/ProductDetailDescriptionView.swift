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
                    
                    Text("5.0")
                        .condensed(.bold, size: 22)
                    
                    Button(action: {}) {
                        Text("(999 Reviews)")
                            .condensed(.light, size: 16)
                    }
                    
                    Spacer()
                    
                    Button(action: {}) {
                        Text("ADD REVIEW")
                            .condensed(.light, size: 16)
                    }
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
