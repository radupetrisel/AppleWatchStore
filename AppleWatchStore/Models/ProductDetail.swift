//
//  ProductDetail.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 28.01.2024.
//

import Foundation

@Observable
final class ProductDetail {
    var selectedCaseSize: CaseSize?
    var selectedWristSize: WristSize?
    var selectedAppleCare: ProductAppleCareType = .none
    var selectedGPSCellular: ProductCellularType = .none
    
    var hasAddedToCart: Bool = false
    
    func addToCartCheck() -> Bool { selectedCaseSize != nil && selectedWristSize != nil && selectedGPSCellular != .none }
}

enum ProductAppleCareType: String {
    case none, add
}

enum ProductCellularType: String, Identifiable, CaseIterable {
    case none, wifiOnly, wifiAndCellular
    
    var id: String { rawValue }
}
