//
//  GridProductItem.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 13.10.2023.
//

import SwiftUI

struct GridProductItem: View {
    let product: Product
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                ZStack {
                    Image(product.band)
                        .resizable()
                        .frame(width: 250, height: 250)
                    
                    Image(product.face)
                        .resizable()
                        .frame(width: 250, height: 250)
                }
                
                VStack {
                    Text("$").ultraLight() +
                    Text(product.displayPrice)
                        .heavy()
                    
                    Text(product.title)
                        .condensed(.bold, size: 14)
                    Text(product.bandDisplay)
                        .condensed(.light, size: 14)
                }
                .foregroundStyle(.primary)
                .padding(.bottom, 5)
                
                HStack {
                    ForEach(0..<3) { item in
                        Circle()
                            .frame(width: 20, height: 20)
                    }
                }
                .padding(.bottom)
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.gradient)
        )
        .overlay(alignment: .topTrailing) {
            Constants.heart
                .symbolVariant(product.isFavourite ? .fill : .none)
                .onLongPressGesture(minimumDuration: 0.25) {
                    product.isFavourite.toggle()
                }
                .font(.system(size: 24))
                .padding(.top, 5)
        }
    }
}

//#Preview {
//    GridProductItem(product: .default)
//}
