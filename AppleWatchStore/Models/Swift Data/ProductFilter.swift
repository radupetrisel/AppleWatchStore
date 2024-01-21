//
//  ProductFilter.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 20.11.2023.
//

import Foundation
import SwiftData

@Model
final class ProductFilter {
    @Attribute(.unique) var id: String
    
    let category: String
    let categoryOrder: Int
    let order: Int
    let title: String
    let type: String
    
    var isSelected: Bool
    
    init(productFilterData: ProductFilterData) {
        id = UUID().uuidString
        category = productFilterData.category
        categoryOrder = productFilterData.categoryOrder
        order = productFilterData.order
        title = productFilterData.title
        type = productFilterData.type
        
        isSelected = productFilterData.isSelected
    }
}

extension ProductFilter {
    var spec: ProductSpecs {
        switch category {
        case "material":
            return ProductSpecs.material(ProductMaterial(rawValue: type) ?? .none)
        case "band":
            return ProductSpecs.band(ProductBandType(rawValue: type) ?? .none)
        default:
            return ProductSpecs.finish(ProductFinish(rawValue: type) ?? .none)
        }
    }
}
