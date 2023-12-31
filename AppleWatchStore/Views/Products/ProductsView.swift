//
//  ProductsView.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 20.10.2023.
//

import SwiftUI

struct ProductsView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                content
                    .navigationTitle("Apple Watches")
                    .navigationBarTitleDisplayMode(.large)
            }
        }
    }
    
    var content: some View {
        ProductsGridView()
    }
}

#Preview {
    ProductsView()
}
