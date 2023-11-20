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
    let bandType: String
    let bandDisplay: String
    let series: String
    let seriesDisplay: String
    let materialType: String
    let materialDisplay: String
    let finishType: String
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
    
    init(productData: ProductData) {
        id = UUID().uuidString
        isFeatured = productData.isFeatured
        bandType = productData.bandType
        bandDisplay = productData.bandDisplay
        series = productData.series
        seriesDisplay = productData.seriesDisplay
        materialType = productData.materialType
        materialDisplay = productData.materialDisplay
        finishType = productData.finishType
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
    
    var band: String { "\(image)-l" }
    
    var face: String { "\(materialType)-\(finishType)-l" }
    
    func createCartProductId(caseSize: String, wristSize: String) -> String {
        return "\(id)-\(caseSize)-\(wristSize)-\(bandColorType)"
    }
}
