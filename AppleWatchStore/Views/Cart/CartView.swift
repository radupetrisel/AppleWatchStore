//
//  CartView.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 20.10.2023.
//

import SwiftUI

struct CartView: View {
    var body: some View {
        NavigationStack {
            List {
                ForEach(0..<1) { item in
                    cartItem
                }
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                .alignmentGuide(.listRowSeparatorLeading, computeValue: { _ in 0
                })
                .background(.baseBackground)
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
    
    var cartItem: some View {
        HStack(alignment: .bottom, spacing: 20) {
            watchImage
            watchDetails
            
            Spacer()
        }
        .padding(.horizontal)
        .frame(minWidth: 0, maxWidth: .infinity)
    }
    
    var watchImage: some View {
        HStack {
            ZStack {
                Image(.sportBandProductRedL)
                    .resizable()
                
                Image(.aluminumMidnightL)
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
    
    var watchDetails: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("Apple Watch Series 8 Apple Watch Series 8")
                    .condensed(.black, size: 18)
                    .lineLimit(2)
                
                Group {
                    Text("$")
                        .ultraLight()
                    + Text("999")
                        .heavy()
                }
                
                Text("45mm")
                    .condensed(.medium, size: 16)
                Text("Starlight Aluminium Case")
                    .condensed(.medium, size: 16)
                Text("Abyss Blue Braided Solo Loop")
                    .condensed(.light, size: 14)
                Text("Loop Size: 99")
                    .condensed(.light, size: 14)
                
                HStack {
                    Image(.iconWifi)
                    Image(.attLogo)
                    Image(.icon5G)
                }
            }
            
            HStack {
                Button(action: {}) {
                    Image(systemName: "minus")
                        .font(.system(size: 18, weight: .bold))
                        .padding(8)
                        .foregroundStyle(.white)
                }
                .frame(width: 40)
                .buttonStyle(.customBorderedBlack)
                
                Text("99")
                    .condensed(.heavy, size: 40)
                
                Button(action: {}) {
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
                        .bold()
                    + Text("999.99")
                        .bold(ofSize: 18)
                }
                
                HStack {
                    Text("Tax")
                        .condensed(.bold, size: 18)
                    
                    Spacer()
                    
                    Text("$")
                        .bold()
                    + Text("999.99")
                        .bold(ofSize: 18)
                }
                
                Divider()
                
                VStack {
                    HStack {
                        Text("Total")
                            .condensed(.black, size: 24)
                        
                        Spacer()
                        
                        Text("$")
                            .ultraLight(ofSize: 18)
                        + Text("999.99")
                            .bold(ofSize: 50)
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
}
