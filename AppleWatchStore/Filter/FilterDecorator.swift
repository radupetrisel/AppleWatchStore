//
//  Category.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 21.01.2024.
//

import Foundation

protocol ProductWatchFilter {
    func filter(products: [Product], by specs: [ProductSpecs]) -> [Product]
}

final class ProductBaseFilter: ProductWatchFilter {
    func filter(products: [Product], by specs: [ProductSpecs]) -> [Product] { products }
}

class ProductFilterDecorator: ProductWatchFilter {
    private let productWatchFilter: ProductWatchFilter
    
    init(productWatchFilter: ProductWatchFilter) {
        self.productWatchFilter = productWatchFilter
    }
    
    func filter(products: [Product], by specs: [ProductSpecs]) -> [Product] { productWatchFilter.filter(products: products, by: specs) }
}

final class ProductMaterialFilter: ProductFilterDecorator {
    override func filter(products: [Product], by specs: [ProductSpecs]) -> [Product] {
        let filter = Filter(strategy: MaterialFilter())
        let filteredProducts = super.filter(products: products, by: specs)
        
        return filter.applyFilter(to: filteredProducts, withSpecs: specs)
    }
}

final class ProductFinishFilter: ProductFilterDecorator {
    override func filter(products: [Product], by specs: [ProductSpecs]) -> [Product] {
        let filter = Filter(strategy: FinishFilter())
        let filteredProducts = super.filter(products: products, by: specs)
        
        return filter.applyFilter(to: filteredProducts, withSpecs: specs)
    }
}

final class ProductBandFilter: ProductFilterDecorator {
    override func filter(products: [Product], by specs: [ProductSpecs]) -> [Product] {
        let filter = Filter(strategy: BandFilter())
        let filteredProducts = super.filter(products: products, by: specs)
        
        return filter.applyFilter(to: filteredProducts, withSpecs: specs)
    }
}
