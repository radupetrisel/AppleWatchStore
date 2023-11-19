//
//  DataManager.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 19.11.2023.
//

import Foundation
import Observation
import OSLog

@Observable
final class DataManager {
    @ObservationIgnored
    private let logger = Logger()
    
    var service = ProductService()
    var filterService = ProductFilterService()
    
    var productData = [ProductData]()
    var filterData = [ProductFilterData]()
    
    func initializeData() async {
        productData = await fetchProducts()
        filterData = await fetchProductFilters()
        
        dump(productData)
        dump(filterData)
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
