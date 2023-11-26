//
//  CardView.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 04.10.2023.
//

import SwiftUI

struct CardView: View {
    let product: FeaturedProduct
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.gradient)
                    .frame(height: 245.0 / 1.55)
                
                VStack {
                    VStack {
                        Image(product.image)
                        
                        VStack {
                            VStack(alignment: .center, spacing: -5) {
                                Text(product.title)
                                    .condensed(.light, size: 16)
                                Text(product.description)
                                    .condensedLowercased(.bold, size: 24)
                                    
                            }
                            
                            Button(action: {}) {
                                Text("Shop")
                                    .condensedLowercased(.medium, size: 24)
                                    .foregroundStyle(.white)
                            }
                            .buttonStyle(.customBorderedBlack)
                        }
                        .foregroundStyle(.primary)
                        .padding(.horizontal)
                        .padding(.bottom)
                    }
                }
            }
        }
    }
}

#Preview {
    CardView(product: .default)
}
