//
//  ProductsFilter.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 21.01.2024.
//

import Combine
import Foundation
import SwiftData

@Observable
final class ProductsFilter {
    private(set) var productFilterSpecs = [ProductSpecs]()
    
    var filterCount: Int { productFilterSpecs.count }
    
    func fetchSaved(filters: [ProductFilter]) {
        productFilterSpecs.removeAll()
        
        for filter in filters {
            if filter.isSelected {
                add(spec: filter.spec)
            }
        }
    }
    
    func add(spec: ProductSpecs) {
        productFilterSpecs.append(spec)
    }
    
    func clearAll() {
        productFilterSpecs.removeAll()
    }
    
    func remove(spec: ProductSpecs) {
        guard let index = productFilterSpecs.firstIndex(of: spec) else {
            preconditionFailure("Error")
        }
        
        productFilterSpecs.remove(at: index)
    }
    
    func filterProducts(products: [Product]) -> [Product] {
        let materialFilter = ProductMaterialFilter(productWatchFilter: ProductBaseFilter())
        let finishFilter = ProductFinishFilter(productWatchFilter: materialFilter)
        let bandFilter = ProductFinishFilter(productWatchFilter: finishFilter)
        
        return bandFilter.filter(products: products, by: productFilterSpecs)
    }
}
