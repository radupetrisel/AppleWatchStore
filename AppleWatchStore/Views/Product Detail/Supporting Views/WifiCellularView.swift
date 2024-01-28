//
//  WifiCellularView.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 18.11.2023.
//

import SwiftUI

struct WifiCellularView: View {
    let type: ProductCellularType
    
    var body: some View {
        HStack {
            Image(.iconWifi)
            
            HStack {
                Image(systemName: "plus")
                
                Image(.icon5G)
            }
            .frame(width: type == .wifiAndCellular ? 50 : 0, height: type == .wifiAndCellular ? 30 : 0)
            .opacity(type == .wifiAndCellular ? 1 : 0)
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .frame(height: 80)
        .padding()
    }
}

#Preview {
    WifiCellularView(type: .wifiAndCellular)
}
