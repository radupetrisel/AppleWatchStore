//
//  CategorySection.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 20.10.2023.
//

import SwiftUI

struct CategorySection: View {
    var body: some View {
        VStack(spacing: 20) {
            SectionHeader(title: "Watch Accessories")
                .padding(.horizontal)
            
            VStack {
                ForEach(0..<5) { item in
                    CategoryListItem()
                }
            }
        }
    }
}

#Preview {
    CategorySection()
}
