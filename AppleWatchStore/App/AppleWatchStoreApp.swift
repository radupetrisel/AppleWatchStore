//
//  AppleWatchStoreApp.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 03.10.2023.
//

import SwiftData
import SwiftUI

@main
struct AppleWatchStoreApp: App {
    @State private var manager = DataManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(manager)
                .modelContainer(manager.modelContainer)
                .task {
                    await manager.initializeData()
                }
        }
    }
}
