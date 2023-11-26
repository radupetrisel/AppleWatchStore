//
//  FeaturedProduct.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 25.11.2023.
//

import Foundation
import SwiftUI

struct FeaturedProduct: Identifiable {
    let id = UUID().uuidString
    
    let image: String
    let title: String
    let description: String
}

extension FeaturedProduct {
    static var `default`: FeaturedProduct {
        FeaturedProduct(image: "", title: "", description: "")
    }
}
