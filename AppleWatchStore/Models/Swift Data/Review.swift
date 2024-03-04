//
//  Review.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 04.03.2024.
//

import Foundation
import SwiftData

@Model
final class Review {
    @Attribute(.unique) var id: String
    
    var title: String
    var summary: String
    var name: String
    var rating: Float
    var creationDate: Date
    
    @Relationship(inverse: \Product.reviews)
    var product: Product?
    
    init(title: String, summary: String, name: String, rating: Float, creationDate: Date) {
        self.id = UUID().uuidString
        self.title = title
        self.summary = summary
        self.name = name
        self.rating = rating
        self.creationDate = creationDate
    }
}
