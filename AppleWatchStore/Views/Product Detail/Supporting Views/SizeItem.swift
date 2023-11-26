//
//  SizeItem.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 14.11.2023.
//

import SwiftUI

struct SizeItem: View {
    let item: CaseSize
    
    var body: some View {
        HStack(alignment: .lastTextBaseline) {
            Text(item.size.uppercased())
                .condensed(.bold, size: 24)
            
            Spacer()
            
            Group {
                Text("$")
                    .ultraLight()
                + Text(item.price)
                    .heavy()
            }
        }
        .padding()
    }
}

//#Preview {
//    SizeItem()
//}
