//
//  CardView.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 04.10.2023.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.gradient)
                    .frame(height: 245.0 / 1.55)
                
                VStack {
                    VStack {
                        Image(.watchCard40Ultra)
                        
                        VStack {
                            VStack(alignment: .center, spacing: -5) {
                                Text("Apple Watch Ultra")
                                    .condensed(.light, size: 16)
                                Text("Ready For Adventure")
                                    .condensedLowercased(.bold, size: 24)
                                    
                            }
                            
                            Button(action: {}) {
                                Text("Shop")
                                    .condensedLowercased(.medium, size: 24)
                                    .foregroundStyle(.white)
                            }
                            .buttonStyle(.customBorderedblack)
                        }
                        .foregroundStyle(.primary)
                        .padding(.horizontal)
                        .padding(.bottom)
                    }
                }
            }
        }
    }
}

#Preview {
    CardView()
}
