//
//  CaseSizeData.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 19.11.2023.
//

import Foundation

final class CaseSizeData: Identifiable, Codable {
    var id: String
    var size: String
    var description: String
    var price: String
    var amount: Float
    var order: Int
    
    init(id: String = UUID().uuidString, size: String = "", description: String = "", price: String = "", amount: Float = 0.0, order: Int = 0) {
        self.id = id
        self.size = size
        self.description = description
        self.price = price
        self.amount = amount
        self.order = order
    }
}

extension CaseSizeData {
    static var `default`: CaseSizeData {
        CaseSizeData(size: "45mm", description: "Fits 140-220mm wrists.", price: "279", amount: 279.0, order: 1)
    }
}
