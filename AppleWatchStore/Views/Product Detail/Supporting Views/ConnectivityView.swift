//
//  ConnectivityView.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 18.11.2023.
//

import SwiftUI

struct ConnectivityView: View {
    @Environment(ProductDetail.self) var productDetail
    
    var body: some View {
        VStack {
            SectionHeader(title: "Connectivity")
            
            HStack {
                ForEach(ProductCellularType.allCases) { item in
                    if item != .none {
                        Button {
                            productDetail.selectedGPSCellular = item
                        } label: {
                            WifiCellularView(type: item)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(strokeColor(for: item), lineWidth: lineWidth(for: item))
                                }
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
        }
    }
    
    private func strokeColor(for cellularType: ProductCellularType) -> Color {
        productDetail.selectedGPSCellular == cellularType ? .baseStroke : .baseMediumGray
    }
    
    private func lineWidth(for cellularType: ProductCellularType) -> CGFloat {
        productDetail.selectedGPSCellular == cellularType ? 2 : 1
    }
}

#Preview {
    ConnectivityView()
        .environment(ProductDetail())
}
