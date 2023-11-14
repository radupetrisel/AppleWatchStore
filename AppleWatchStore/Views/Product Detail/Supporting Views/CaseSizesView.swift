//
//  CaseSizesView.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 14.11.2023.
//

import SwiftUI

struct CaseSizesView: View {
    var body: some View {
        VStack {
            SectionHeader(title: "Case sizes")
                .padding(.bottom)
            
            ForEach(0..<3) { item in
                Button { } label: {
                    SizeItem()
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
    CaseSizesView()
}
