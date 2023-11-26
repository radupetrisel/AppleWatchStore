//
//  WristSizesView.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 18.11.2023.
//

import SwiftUI

struct WristSizesView: View {
    let wristSizes: [WristSize]
    
    var body: some View {
        VStack {
            SectionHeader(title: "Wrist sizes")
                .padding(.bottom)
            
            ForEach(wristSizes) { wristSize in
                Button { } label: {
                    WristItem(wristSize: wristSize)
                        .contentShape(.rect(cornerRadius: 10))
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.baseMediumGray, lineWidth: 1)
                        }
                }
                .buttonStyle(.plain)
            }
        }
    }
}

//#Preview {
//    WristSizesView()
//}
