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
                ForEach(Constants.categories, id: \.name) { item in
                    CategoryListItem(item: item)
                }
            }
        }
    }
}

#Preview {
    CategorySection()
}
