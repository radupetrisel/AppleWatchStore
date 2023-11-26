//
//  WristSize.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 20.11.2023.
//

import Foundation
import SwiftData

@Model
final class WristSize {
    @Attribute(.unique) var id: String
    
    let size: String
    let desc: String
    let order: Int
    
    init(wristSizeData: WristSizeData) {
        id = UUID().uuidString
        size = wristSizeData.size
        desc = wristSizeData.description
        order = wristSizeData.order
    }
}

extension WristSize {
    static var `default`: WristSize {
        WristSize(wristSizeData: .default)
    }
}
