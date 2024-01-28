//
//  CaseSizesView.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 14.11.2023.
//

import SwiftUI

struct CaseSizesView: View {
    @Environment(ProductDetail.self) var productDetail
    
    let caseSizes: [CaseSize]
    
    var body: some View {
        VStack {
            SectionHeader(title: "Case sizes")
                .padding(.bottom)
            
            ForEach(caseSizes) { item in
                Button {
                    productDetail.selectedCaseSize = item
                } label: {
                    SizeItem(item: item)
                        .contentShape(.rect(cornerRadius: 10))
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(strokeColor(for: item), lineWidth: lineWidth(for: item))
                        }
                }
                .buttonStyle(.plain)
            }
        }
    }
    
    private func strokeColor(for caseSize: CaseSize) -> Color {
        productDetail.selectedCaseSize == caseSize ? .baseStroke : .baseMediumGray
    }
    
    private func lineWidth(for caseSize: CaseSize) -> CGFloat {
        productDetail.selectedCaseSize == caseSize ? 2 : 1
    }
}

//#Preview {
//    CaseSizesView(caseSizes: )
//}
