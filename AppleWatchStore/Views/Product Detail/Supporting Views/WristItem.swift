//
//  WristItem.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 18.11.2023.
//

import SwiftUI

struct WristItem: View {
    let wristSize: WristSize
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(wristSize.size)
                .condensedLowercased(.bold, size: 24)
            
            Text(wristSize.desc)
                .condensed(.light, size: 16)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .bottomLeading)
        .frame(height: 80)
        .padding()
    }
}

//#Preview {
//    WristItem()
//}
