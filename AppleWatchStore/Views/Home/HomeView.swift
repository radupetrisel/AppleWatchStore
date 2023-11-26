//
//  HomeView.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 20.10.2023.
//

import SwiftUI

struct HomeView: View {
    @Environment(DataManager.self) private var manager
    
    var body: some View {
        NavigationStack {
            ScrollView {
                content
            }
            .navigationTitle("WELCOME")
            .navigationBarTitleDisplayMode(.large)
            .overlay {
                if manager.dbInitalizationInProgress {
                    ProgressView("Loading")
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .background()
                }
            }
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

#Preview("Loaded") {
    HomeView()
        .environment(DataManager())
}

#Preview("Loading") {
    let dataManager = DataManager()
    dataManager.dbInitalizationInProgress = true
    
    return HomeView()
        .environment(dataManager)
}
