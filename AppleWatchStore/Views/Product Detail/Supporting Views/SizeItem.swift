//
//  SizeItem.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 14.11.2023.
//

import SwiftUI

struct SizeItem: View {
    var body: some View {
        HStack(alignment: .lastTextBaseline) {
            Text("49mm")
                .condensed(.bold, size: 24)
            
            Spacer()
            
            Group {
                Text("$")
                    .ultraLight()
                + Text("999")
                    .heavy()
            }
        }
        .padding()
    }
}

#Preview {
    SizeItem()
}
