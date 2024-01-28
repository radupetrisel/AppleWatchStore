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
    @State private var productsFilter = ProductsFilter()
    @State private var productDetail = ProductDetail()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(manager)
                .environment(productsFilter)
                .environment(productDetail)
                .modelContainer(manager.modelContainer)
                .task {
                    await manager.initializeData()
                }
        }
    }
}
