//
//  WristSizesView.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 18.11.2023.
//

import SwiftUI

struct WristSizesView: View {
    var body: some View {
        VStack {
            SectionHeader(title: "Wrist sizes")
                .padding(.bottom)
            
            ForEach(0..<3) { item in
                Button { } label: {
                    WristItem()
                        .contentShape(.rect(cornerRadius: 10))
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.baseMediumGray, lineWidth: 1)
                        }
                }
                .buttonStyle(.plain)
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    WristSizesView()
}
