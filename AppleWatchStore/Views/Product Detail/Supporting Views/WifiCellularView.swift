//
//  WifiCellularView.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 18.11.2023.
//

import SwiftUI

struct WifiCellularView: View {
    var body: some View {
        HStack {
            Image(.iconWifi)
            
            HStack {
                Image(systemName: "plus")
                
                Image(.icon5G)
            }
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .frame(height: 80)
        .padding()
    }
}

#Preview {
    WifiCellularView()
}
