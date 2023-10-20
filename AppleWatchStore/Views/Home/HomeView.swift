//
//  HomeView.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 20.10.2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                content
            }
            .navigationTitle("WELCOME")
            .navigationBarTitleDisplayMode(.large)
            .background(.baseBackground)
        }
    }
    
    var content: some View {
        VStack {
            BrowseSection()
            PopularSection()
            CategorySection()
        }
    }
}

#Preview {
    HomeView()
}
