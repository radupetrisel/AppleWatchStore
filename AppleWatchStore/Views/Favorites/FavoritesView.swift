//
//  FavoritesView.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 20.10.2023.
//

import SwiftUI

struct FavoritesView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 70) {
                    ForEach(0..<3) { item in
                        NavigationLink {
                            
                        } label: {
                            WideProductItem()
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.top, 60)
            }
            .background(.baseBackground)
            .navigationTitle("MY FAVORITES")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    FavoritesView()
}
