//
//  ProductData.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 19.11.2023.
//

import Foundation

final class ProductData: Identifiable, Codable {
    let id: String
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
    let caseSizes: [CaseSizeData]
    let wristSizes: [WristSizeData]
    var isFavourite = false
    
    init(
        id: String,
        isFeatured: Bool,
        bandType: String,
        bandDisplay: String,
        series: String,
        seriesDisplay: String,
        materialType: String,
        materialDisplay: String,
        finishType: String,
        finishDisplay: String,
        bandColorType: String,
        bandColorDisplay: String,
        collection: String,
        collectionType: String,
        image: String,
        desc: String,
        caseSizes: [CaseSizeData],
        wristSizes: [WristSizeData],
        isFavourite: Bool = false
    ) {
        self.id = id
        self.isFeatured = isFeatured
        self.bandType = bandType
        self.bandDisplay = bandDisplay
        self.series = series
        self.seriesDisplay = seriesDisplay
        self.materialType = materialType
        self.materialDisplay = materialDisplay
        self.finishType = finishType
        self.finishDisplay = finishDisplay
        self.bandColorType = bandColorType
        self.bandColorDisplay = bandColorDisplay
        self.collection = collection
        self.collectionType = collectionType
        self.image = image
        self.desc = desc
        self.caseSizes = caseSizes
        self.wristSizes = wristSizes
        self.isFavourite = isFavourite
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case isFeatured = "isFeatured"
        case bandType = "band-type"
        case bandDisplay = "band-display"
        case series
        case seriesDisplay = "series-display"
        case materialType = "material-type"
        case materialDisplay = "material-display"
        case finishType = "finish-type"
        case finishDisplay = "finish-display"
        case bandColorType = "band-color-type"
        case bandColorDisplay = "band-color-display"
        case collection
        case collectionType = "collection-type"
        case image
        case desc = "description"
        case caseSizes = "case-sizes"
        case wristSizes = "wrist-sizes"
    }
}

extension ProductData {
    static var `default`: ProductData {
        ProductData(
            id: "se-sport-loop-aluminium-starling-midnight",
            isFeatured: false,
            bandType: "sport-loop",
            bandDisplay: "Sport Loop",
            series: "se",
            seriesDisplay: "Apple Watch SE",
            materialType: "aluminium",
            materialDisplay: "Aluminium",
            finishType: "silver",
            finishDisplay: "Silver",
            bandColorType: "midnight",
            bandColorDisplay: "Midnight",
            collection: "Apple Watch",
            collectionType: "apple-watch",
            image: "sport-band-olive",
            desc: "The aluminum case is lightweight and made from 100 percent recycled aerospace-grade alloy. The Sport Loop is made from a soft and breathable double-layer nylon weave, with a hook-and-loop fastener for quick and easy adjustment.",
            caseSizes: [
                .default
            ],
            wristSizes: [
                .default
            ]
        )
    }
}
