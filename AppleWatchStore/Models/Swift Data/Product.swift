//
//  Product.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 20.11.2023.
//

import Foundation
import SwiftData

@Model
final class Product {
    @Attribute(.unique) var id: String
    
    let isFeatured: Bool
    let bandTypeString: String
    let bandDisplay: String
    let series: String
    let seriesDisplay: String
    let materialTypeString: String
    let materialDisplay: String
    let finishTypeString: String
    let finishDisplay: String
    let bandColorType: String
    let bandColorDisplay: String
    let collection: String
    let collectionType: String
    let image: String
    let desc: String
    var isFavourite: Bool
    
    @Relationship(deleteRule: .cascade)
    var caseSizes: [CaseSize]
    
    @Relationship(deleteRule: .cascade)
    var wristSizes: [WristSize]
    
    @Relationship(deleteRule: .cascade)
    var reviews: [Review]
    
    init(productData: ProductData) {
        id = UUID().uuidString
        isFeatured = productData.isFeatured
        bandTypeString = productData.bandType
        bandDisplay = productData.bandDisplay
        series = productData.series
        seriesDisplay = productData.seriesDisplay
        materialTypeString = productData.materialType
        materialDisplay = productData.materialDisplay
        finishTypeString = productData.finishType
        finishDisplay = productData.finishDisplay
        bandColorType = productData.bandColorType
        bandColorDisplay = productData.bandColorDisplay
        collection = productData.collection
        collectionType = productData.collectionType
        image = productData.image
        desc = productData.desc
        isFavourite = productData.isFavourite
        
        caseSizes = productData.caseSizes.map(CaseSize.init(caseSizeData:))
        wristSizes = productData.wristSizes.map(WristSize.init(wristSizeData:))
        reviews = []
    }
}

extension Product {
    static var `default`: Product {
        Product(productData: .default)
    }
    
    var displayPrice: String {
        if let value = caseSizes.first {
            return value.price
        }
        
        return ""
    }
    
    var title: String { "\(materialDisplay) \(finishDisplay) Case" }
    
    var detailTitle: String { "\(materialDisplay) \(finishTypeString) Case with \(bandDisplay)" }
    
    var band: String { "\(image)-l" }
    
    var face: String { "\(materialTypeString)-\(finishTypeString)-l" }
    
    func createCartProductId(caseSize: String, wristSize: String) -> String { "\(id)-\(caseSize)-\(wristSize)-\(bandColorType)" }
    
    var bandType: ProductBandType { ProductBandType(rawValue: bandTypeString) ?? .none}
    
    var materialType: ProductMaterial { ProductMaterial(rawValue: materialTypeString) ?? .none }
    
    var finishType: ProductFinish { ProductFinish(rawValue: finishTypeString) ?? .none }
    
    var ratingAverage: Float { reviews.map { $0.rating }.reduce(0.0, +) / Float(reviews.count) }
}
