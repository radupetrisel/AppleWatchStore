//
//  AppleCareView.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 18.11.2023.
//

import SwiftUI

struct AppleCareView: View {
    var body: some View {
        VStack(spacing: 20) {
            SectionHeader(title: "AppleCare+ Coverage")
                .padding(.bottom)
            
            addAppleCare
            noAppleCare
        }
    }
    
    var noAppleCare: some View {
        Button(action: {}) {
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
                    .stroke(.baseMediumGray, lineWidth: 1)
            }
        }
        .buttonStyle(.plain)
    }
    
    var addAppleCare: some View {
        Button(action: {}) {
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
                    .stroke(.baseMediumGray, lineWidth: 1)
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
}

#Preview {
    AppleCareView()
}
