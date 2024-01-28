//
//  AppleCareView.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 18.11.2023.
//

import SwiftUI

struct AppleCareView: View {
    @Environment(ProductDetail.self) var productDetail
    
    var body: some View {
        VStack(spacing: 20) {
            SectionHeader(title: "AppleCare+ Coverage")
                .padding(.bottom)
            
            addAppleCare
            noAppleCare
        }
    }
    
    var noAppleCare: some View {
        Button {
            productDetail.selectedAppleCare = .none
        } label: {
            VStack(alignment: .leading) {
                Text("No AppleCare+")
                    .condensed(.bold, size: 18)
            }
            .padding(.vertical, 20)
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .clipShape(.rect(cornerRadius: 10))
            .contentShape(RoundedRectangle(cornerRadius: 10))
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(strokeColor(for: .none), lineWidth: lineWidth(for: .none))
            }
        }
        .buttonStyle(.plain)
    }
    
    var addAppleCare: some View {
        Button {
            productDetail.selectedAppleCare = .add
        } label: {
            VStack(alignment: .leading) {
                header
                content
            }
            .padding(.vertical, 10)
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .clipShape(.rect(cornerRadius: 10))
            .contentShape(RoundedRectangle(cornerRadius: 10))
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(strokeColor(for: .add), lineWidth: lineWidth(for: .add))
            }
        }
        .buttonStyle(.plain)
    }
    
    var header: some View {
        VStack {
            HStack(alignment: .lastTextBaseline) {
                Image(systemName: "apple.logo")
                    .foregroundStyle(.baseAppleRed)
                
                Text("Add AppleCare+")
                    .condensed(.bold, size: 18)
                
                Spacer()
                
                Text("$99 or $9.99/month")
                    .condensed(.regular, size: 14)
            }
            
            Divider()
        }
    }
    
    var content: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .firstTextBaseline) {
                Text("•")
                Text("Unlimited repairs for accidental damage\n protection")
            }
            
            HStack(alignment: .firstTextBaseline) {
                Text("•")
                Text("Unlimited repairs for accidental damage\n protection")
            }
            
            HStack(alignment: .firstTextBaseline) {
                Text("•")
                Text("Unlimited repairs for accidental damage\n protection")
            }
            
            HStack(alignment: .firstTextBaseline) {
                Text("•")
                Text("Unlimited repairs for accidental damage\n protection")
            }
        }
        .foregroundStyle(.baseMediumGray)
    }
    
    private func strokeColor(for appleCare: ProductAppleCareType) -> Color {
        productDetail.selectedAppleCare == appleCare ? .baseStroke : .baseMediumGray
    }
    
    private func lineWidth(for appleCare: ProductAppleCareType) -> CGFloat {
        productDetail.selectedAppleCare == appleCare ? 2 : 1
    }
}

#Preview {
    AppleCareView()
        .environment(ProductDetail())
}
