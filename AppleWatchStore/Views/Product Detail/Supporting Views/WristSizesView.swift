//
//  WristSizesView.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 18.11.2023.
//

import SwiftUI

struct WristSizesView: View {
    @Environment(ProductDetail.self) var productDetail
    let wristSizes: [WristSize]
    
    var body: some View {
        VStack {
            SectionHeader(title: "Wrist sizes")
                .padding(.bottom)
            
            ForEach(wristSizes) { wristSize in
                Button { 
                    productDetail.selectedWristSize = wristSize
                } label: {
                    WristItem(wristSize: wristSize)
                        .contentShape(.rect(cornerRadius: 10))
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(strokeColor(for: wristSize), lineWidth: lineWidth(for: wristSize))
                        }
                }
                .buttonStyle(.plain)
            }
        }
    }
    
    private func strokeColor(for wristSize: WristSize) -> Color {
        productDetail.selectedWristSize == wristSize ? .baseStroke : .baseMediumGray
    }
    
    private func lineWidth(for wristSize: WristSize) -> CGFloat {
        productDetail.selectedWristSize == wristSize ? 2 : 1
    }
}

//#Preview {
//    WristSizesView()
//}
