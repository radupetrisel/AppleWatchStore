//
//  CartView.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 20.10.2023.
//

import SwiftUI

struct CartView: View {
    @Environment(ShoppingCart.self) var cart
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(cart.products, content: cartItem(product:))
                    .onDelete(perform: cart.remove(atOffsets:))
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    .alignmentGuide(.listRowSeparatorLeading, computeValue: { _ in 0
                    })
                    .background(.baseBackground)
            }
            .overlay {
                if cart.products.isEmpty {
                    ContentUnavailableView {
                        Label("No products", systemImage: "cart")
                    } description: {
                        Text("Please add products.")
                    }
                }
            }
            .safeAreaInset(edge: .bottom) { cartTotals }
            .scrollIndicators(.hidden)
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
            .navigationTitle("MY BAG")
            .navigationBarTitleDisplayMode(.large)
            .background(.baseBackground)
        }
    }
    
    func cartItem(product: CartProduct) -> some View {
        HStack(alignment: .bottom, spacing: 20) {
            watchImage(product: product)
            watchDetails(product: product)
            
            Spacer()
        }
        .padding(.horizontal)
        .frame(minWidth: 0, maxWidth: .infinity)
    }
    
    func watchImage(product: CartProduct) -> some View {
        HStack {
            ZStack {
                Image(product.band)
                    .resizable()
                
                Image(product.face)
                    .resizable()
            }
            .frame(width: 268, height: 268)
            .padding(.bottom, 25)
            .frame(width: 180)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(.gradient)
            )
        }
    }
    
    func watchDetails(product: CartProduct) -> some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text(product.productSeries)
                    .condensed(.black, size: 18)
                    .lineLimit(2)
                
                Group {
                    Text("$")
                        .ultraLight()
                    + Text(product.displayPrice)
                        .heavy()
                }
                
                Text(product.caseSize)
                    .condensed(.medium, size: 16)
                Text("\(product.caseMaterial) \(product.caseFinish) Case")
                    .condensed(.medium, size: 16)
                Text("\(product.bandColor) \(product.bandName)")
                    .condensed(.light, size: 14)
                Text("Loop Size: \(product.wristSize)")
                    .condensed(.light, size: 14)
                
                HStack {
                    Image(.iconWifi)
                    Image(.attLogo)
                    Image(.icon5G)
                        .opacity(product.cellularType == .wifiAndCellular ? 1 : 0)
                }
            }
            
            HStack {
                Button {
                    cart.decrement(product: product)
                } label: {
                    Image(systemName: "minus")
                        .font(.system(size: 18, weight: .bold))
                        .padding(8)
                        .foregroundStyle(.white)
                }
                .frame(width: 40)
                .buttonStyle(.customBorderedBlack)
                
                Text(String(product.quantity))
                    .condensed(.heavy, size: 40)
                
                Button {
                    cart.increment(product: product)
                } label: {
                    Image(systemName: "plus")
                        .font(.system(size: 18, weight: .bold))
                        .padding(3)
                        .foregroundStyle(.white)
                }
                .frame(width: 40)
                .buttonStyle(.customBorderedBlack)
            }
        }
        .frame(maxHeight: 280)
    }
    
    var cartTotals: some View {
        ZStack {
            Rectangle()
                .fill(.white.opacity(0.2))
                .frame(height: 200)
                .background(.regularMaterial, in: Rectangle())
            
            VStack {
                HStack {
                    Text("Subtotal")
                        .condensed(.bold, size: 18)
                    
                    Spacer()
                    
                    Text("$")
                        .ultraLight()
                    + Text(String(format: "%.2f", cart.total))
                        .customBold(ofSize: 18)
                }
                
                HStack {
                    Text("Tax")
                        .condensed(.bold, size: 18)
                    
                    Spacer()
                    
                    Text("$")
                        .ultraLight()
                    + Text(String(format: "%.2f", cart.getTax()))
                        .customBold(ofSize: 18)
                }
                
                Divider()
                
                VStack {
                    HStack {
                        Text("Total")
                            .condensed(.black, size: 24)
                        
                        Spacer()
                        Text(String(format: "%.2f", cart.getOrderTotal()))
                            .customBold(ofSize: 50)
                            .overlay(alignment: .topLeading) {
                                Text("$")
                                    .ultraLight(ofSize: 18)
                                    .offset(x: -8, y: 10)
                            }
                    }
                }
            }
            .padding()
        }
        .frame(height: 200)
    }
}

#Preview {
    CartView()
        .environment(ShoppingCart())
}
