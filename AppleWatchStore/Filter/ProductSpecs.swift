//
//  ProductSpecs.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 21.01.2024.
//

import Foundation

enum ProductSpecs: Equatable {
    case material(ProductMaterial)
    case finish(ProductFinish)
    case band(ProductBandType)
    case none
}

enum ProductMaterial: String, Hashable, CaseIterable {
    case aluminium
    case steel
    case none
    
    var id: String { rawValue }
}

enum ProductFinish: String, Hashable, CaseIterable {
    case midnight
    case starlight
    case gold
    case silver
    case graphite
    case black
    case red = "product-red"
    case none
    
    var id: String { rawValue }
}

enum ProductBandType: String, Hashable, CaseIterable {
    case solo = "solo-dash"
    case braided = "braider-solo-loop"
    case sportsBand = "sports-band"
    case sportsLoop = "sports-loop"
    case nike
    case leather
    case steel
    case nylon
    case none
    
    var id: String { rawValue }
}
