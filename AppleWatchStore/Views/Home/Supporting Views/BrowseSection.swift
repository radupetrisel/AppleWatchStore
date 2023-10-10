//
//  BrowseSection.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 10.10.2023.
//

import SwiftUI

struct BrowseSection: View {
    var body: some View {
        VStack(spacing: 30) {
            SectionHeader(title: "Browse by model")
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(0..<4) { _ in
                        CardView()
                            .frame(width: UIScreen.main.bounds.width - 30)
                            .frame(minWidth: 0, maxWidth: .infinity)
                    }
                }
            }
            .safeAreaPadding(.horizontal, 10)
            .scrollTargetBehavior(.paging)
        }
    }
}

#Preview {
    BrowseSection()
}
