//
//  ProductLayout.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 21.01.2024.
//

import Foundation
import SwiftUI

enum ProductLayout: String, Identifiable, CaseIterable {
    case grid
    case list
    case none
    
    var id: String { rawValue }
    
    var title: LocalizedStringKey {
        switch self {
        case .grid:
            return "Grid"
        case .list:
            return "List"
        case .none:
            return ""
        }
    }
    
    var image: String {
        switch self {
        case .grid:
            return "square.grid.2x2"
        case .list:
            return "rectangle.grid.1x2"
        case .none:
            return ""
        }
    }
}
