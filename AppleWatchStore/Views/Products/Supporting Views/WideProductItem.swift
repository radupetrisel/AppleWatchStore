//
//  WireProductItem.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 04.11.2023.
//

import SwiftUI

struct WideProductItem: View {
    let product: Product
    
    var body: some View {
        ZStack {
            HStack(alignment: .bottom, spacing: 0) {
                VStack(spacing: 5) {
                    ZStack {
                        Image(product.band)
                            .resizable()
                            .frame(width: 250, height: 250)
                        
                        Image(product.face)
                            .resizable()
                            .frame(width: 250, height: 250)
                    }
                    .frame(width: 150)
                    .padding(.trailing)
                    
                    HStack {
                        ForEach(0..<3) { item in
                            Circle()
                                .frame(width: 20, height: 20)
                        }
                    }
                }
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: -4) {
                    Text("$").ultraLight() +
                    Text(product.displayPrice)
                        .heavy()
                    
                    VStack(alignment: .trailing) {
                        Text(product.title)
                            .condensed(.bold, size: 16)
                        Text(product.bandDisplay)
                            .condensed(.light, size: 16)
                    }
                }
                .foregroundStyle(.primary)
            }
        }
        .padding()
        .frame(height: 220, alignment: .bottom)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.gradient)
        )
        .frame(maxWidth: .infinity, alignment: .bottom)
        .overlay(alignment: .topTrailing) {
            Constants.heart
                .symbolVariant(product.isFavourite ? .fill : .none)
                .onLongPressGesture(minimumDuration: 0.25) {
                    product.isFavourite.toggle()
                }
                .font(.system(size: 24))
                .padding(.top, 5)
        }
        .padding(.horizontal)
    }
}

#Preview {
    WideProductItem(product: .default)
}
