//
//  FilterStrategy.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 21.01.2024.
//

import Foundation

final class Filter {
    private var strategy: ProductFilterStrategy
    
    init(strategy: ProductFilterStrategy) {
        self.strategy = strategy
    }
    
    func update(strategy: ProductFilterStrategy) {
        self.strategy = strategy
    }
    
    func applyFilter(to products: [Product], withSpecs specs: [ProductSpecs]) -> [Product] {
        strategy.filter(products: products, by: specs)
    }
}

protocol ProductFilterStrategy {
    func filter(products: [Product], by specs: [ProductSpecs]) -> [Product]
}

final class FinishFilter: ProductFilterStrategy {
    func filter(products: [Product], by specs: [ProductSpecs]) -> [Product] {
        let finishSpecs = Set(specs.compactMap { spec in
            if case let .finish(productFinish) = spec {
                return productFinish.rawValue
            }
            
            return nil
        })
        
        if finishSpecs.isEmpty {
            return products
        }
        
        return products.filter { finishSpecs.contains($0.finishType.rawValue)}
    }
}

final class MaterialFilter: ProductFilterStrategy {
    func filter(products: [Product], by specs: [ProductSpecs]) -> [Product] {
        let materialSpecs = Set(specs.compactMap { spec in
            if case let .material(productMaterial) = spec {
                return productMaterial.rawValue
            }
            
            return nil
        })
        
        if materialSpecs.isEmpty {
            return products
        }
        
        return products.filter { materialSpecs.contains($0.materialType.rawValue) }
    }
}

final class BandFilter: ProductFilterStrategy {
    func filter(products: [Product], by specs: [ProductSpecs]) -> [Product] {
        let bandSpecs = Set(specs.compactMap { spec in
            if case let .band(productBand) = spec {
                return productBand.rawValue
            }
            
            return nil
        })
        
        if bandSpecs.isEmpty {
            return products
        }
        
        return products.filter { bandSpecs.contains($0.bandType.rawValue) }
    }
}
