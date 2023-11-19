//
//  WristSizeData.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 19.11.2023.
//

import Foundation

final class WristSizeData: Identifiable, Codable {
    var id: String
    var size: String
    var description: String
    var order: Int
    
    init(id: String = UUID().uuidString, size: String = "", description: String = "", order: Int = 0) {
        self.id = id
        self.size = size
        self.description = description
        self.order = order
    }
}

extension WristSizeData {
    static var `default`: WristSizeData {
        WristSizeData(size: "S/M", description: "Band fits 130-180mm wrists.", order: 1)
    }
}
