//
//  CartProduct.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 03.03.2024.
//

import Foundation
import SwiftUI


final class CartProduct: Identifiable {
    var id: String
    var name: String
    var image: String
    var price: Float
    var productSeries: String
    var displayPrice: String
    var quantity: Int
    var description: String
    var bandName: String
    var bandColor: String
    var caseMaterial: String
    var caseFinish: String
    var caseSize: String
    var caseSizeID: String
    var caseAmount: Float
    var wristSize: String
    var wristSizeID: String
    var cellularType: ProductCellularType
    
    init(product: Product, caseSize: CaseSize, wristSize: WristSize, cellularType: ProductCellularType, quantity: Int) {
        self.name = product.seriesDisplay
        self.image = product.image
        self.price = Float (caseSize.amount)
        self.displayPrice = String(caseSize.amount.formatted(FloatingPointFormatStyle()))
        self.productSeries = product.seriesDisplay
        self.quantity = quantity
        self.description = product.desc
        self.bandName = product.bandType.rawValue
        self.bandColor = product.bandColorDisplay
        self.caseMaterial = product.materialDisplay
        self.caseFinish = product.finishDisplay
        self.caseSize = caseSize.size
        self.caseSizeID = caseSize.id
        self.caseAmount = Float(caseSize.amount)
        self.wristSize = wristSize.size
        self.wristSizeID = wristSize.id
        self.cellularType = cellularType
        let wrist = self.wristSize.replacingOccurrences(of: " ", with: "")
        self.id = product.createCartProductId(caseSize: self.caseSize, wristSize: wrist).lowercased()
    }
    
    var band: String { "\(image)-l"}
    
    var face: String { "\(caseMaterial.lowercased())-\(caseFinish.lowercased())-l"}
}

extension CartProduct {
    static var `default`: CartProduct {
        CartProduct(
            product: .default,
            caseSize: .default,
            wristSize: .default,
            cellularType: .wifiAndCellular,
            quantity: 2)
    }
}
