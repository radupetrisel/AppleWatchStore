//
//  DataManager.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 19.11.2023.
//

import Foundation
import Observation
import OSLog
import SwiftData

@Observable
final class DataManager {
    private static let hasSetupDbKey = "hasSetupDb"
    
    @ObservationIgnored
    private let logger = Logger()
    
    var service = ProductService()
    var filterService = ProductFilterService()
    
    var productData = [ProductData]()
    var filterData = [ProductFilterData]()
    
    var dbInitalizationInProgress = false
    
    let modelContainer = try! ModelContainer(for: Product.self, ProductFilter.self, Review.self)
    
    var hasSetUpDb: Bool {
        didSet {
            UserDefaults.standard.setValue(hasSetUpDb, forKey: Self.hasSetupDbKey)
        }
    }
    
    init() {
        hasSetUpDb = UserDefaults.standard.object(forKey: Self.hasSetupDbKey) as? Bool ?? false
    }
    
    func initializeData() async {
        guard !hasSetUpDb else { return }
        
        dbInitalizationInProgress = true
        
        productData = await fetchProducts()
        filterData = await fetchProductFilters()
        
        dump(productData)
        dump(filterData)
        
        guard productData.isNotEmpty && filterData.isNotEmpty else { return }
        
        Task { @MainActor in
            let products = productData.map(Product.init(productData:))
            let filters = filterData.map(ProductFilter.init(productFilterData:))
            
            for product in products {
                modelContainer.mainContext.insert(product)
            }
            
            for filter in filters {
                modelContainer.mainContext.insert(filter)
            }
            
            dbInitalizationInProgress = false
            hasSetUpDb = true
            
            print("========= DB DATA =========")
            dump(products)
            dump(filters)
        }
    }
    
    @MainActor
    func addProductReview(product: Product, data: ReviewData) {
        let review = Review(title: data.title, summary: data.summary, name: data.name, rating: data.rating, creationDate: .now)
        product.reviews.append(review)
        modelContainer.mainContext.insert(review)
    }
    
    private func fetchProducts() async -> [ProductData] {
        let results = await service.fetchProducts()
        
        switch results {
        case .success(let products):
            return products
        case .failure(let failure):
            dump(failure)
            logger.error("\(failure.localizedDescription)")
            return []
        }
    }
    
    private func fetchProductFilters() async -> [ProductFilterData] {
        let results = await filterService.fetchProductFilters()
        
        switch results {
        case .success(let filters):
            return filters
        case .failure(let failure):
            logger.error("\(failure.localizedDescription)")
            return []
        }
    }
}
