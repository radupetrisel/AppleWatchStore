//
//  CaseSize.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 20.11.2023.
//

import Foundation
import SwiftData

@Model
final class CaseSize {
    @Attribute(.unique) var id: String
    
    let size: String
    let desc: String
    let price: String
    let amount: Double
    let order: Int
    
    init(caseSizeData: CaseSizeData) {
        id = UUID().uuidString
        size = caseSizeData.size
        desc = caseSizeData.description
        price = caseSizeData.price
        amount = Double(caseSizeData.amount)
        order = caseSizeData.order
    }
}

extension CaseSize {
    static var `default`: CaseSize {
        CaseSize(caseSizeData: .default)
    }
}
