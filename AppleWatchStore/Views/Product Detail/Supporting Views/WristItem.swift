//
//  WristItem.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 18.11.2023.
//

import SwiftUI

struct WristItem: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Large")
                .condensedLowercased(.bold, size: 24)
            
            Text("Fits 165-210mm wrists.")
                .condensed(.light, size: 16)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .bottomLeading)
        .frame(height: 80)
        .padding()
    }
}

#Preview {
    WristItem()
}
