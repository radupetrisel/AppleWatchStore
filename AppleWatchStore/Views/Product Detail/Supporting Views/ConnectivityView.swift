//
//  ConnectivityView.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 18.11.2023.
//

import SwiftUI

struct ConnectivityView: View {
    var body: some View {
        VStack {
            SectionHeader(title: "Connectivity")
            
            HStack {
                ForEach(0..<2) { item in
                    Button(action: {}) {
                        WifiCellularView()
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
}

#Preview {
    ConnectivityView()
}
