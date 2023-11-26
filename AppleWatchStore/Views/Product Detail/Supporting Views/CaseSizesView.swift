//
//  CaseSizesView.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 14.11.2023.
//

import SwiftUI

struct CaseSizesView: View {
    let caseSizes: [CaseSize]
    
    var body: some View {
        VStack {
            SectionHeader(title: "Case sizes")
                .padding(.bottom)
            
            ForEach(caseSizes) { item in
                Button { } label: {
                    SizeItem(item: item)
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
//    CaseSizesView(caseSizes: )
//}
