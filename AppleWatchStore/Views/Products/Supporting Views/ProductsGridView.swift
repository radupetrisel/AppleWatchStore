//
//  ProductsGridView.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 25.10.2023.
//

import SwiftUI

struct ProductsGridView: View {
    var body: some View {
        VStack {
            LazyVGrid(columns: Constants.columns, spacing: 16) {
                ForEach(0..<12) { _ in
                    NavigationLink {
                    } label: {
                        GridProductItem()
                    }
                .buttonStyle(.plain)
                }
            }
        }
        .padding(2)
    }
}

#Preview {
    NavigationStack {
        ProductsGridView()
    }
}
