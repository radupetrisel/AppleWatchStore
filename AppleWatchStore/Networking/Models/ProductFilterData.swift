//
//  ProductFilterData.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 19.11.2023.
//

import Foundation

final class ProductFilterData: Identifiable, Codable {
    let id: String
    let category: String
    let categoryOrder: Int
    let order: Int
    let title: String
    let type: String
    let isSelected: Bool
    
    init(
        id: String,
        category: String,
        categoryOrder: Int,
        order: Int,
        title: String,
        type: String,
        isSelected: Bool
    ) {
        self.id = id
        self.category = category
        self.categoryOrder = categoryOrder
        self.order = order
        self.title = title
        self.type = type
        self.isSelected = isSelected
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case category
        case categoryOrder = "category-order"
        case order
        case title
        case type
        case isSelected
    }
}
