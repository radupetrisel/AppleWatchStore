//
//  Constants.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 20.10.2023.
//

import SwiftUI

enum Constants {
    static let columns = [
        GridItem(.flexible(minimum: 100, maximum: .infinity)),
        GridItem(.flexible(minimum: 100, maximum: .infinity)),
    ]
    
    static let filterColumns = [
        GridItem(.adaptive(minimum: 120)),
        GridItem(.adaptive(minimum: 120)),
    ]
    
    static var heart: some View {
        Image(systemName: "heart")
            .symbolVariant(.none)
            .font(.system(size: 24))
            .padding(.trailing, 20)
            .padding(.top, 10)
    }
    
    static let featuredProducts: [FeaturedProduct] = [
        FeaturedProduct(image: "watch-card-40-ultra", title: "Apple Watch Ultra", description: "Ready for Adventure"),
        FeaturedProduct(image: "watch-card-40-se", title: "Apple watch SE", description: "Capable and Affordable"),
        FeaturedProduct(image: "watch-card-40-s8", title: "Apple Watch Series 8", description: "Advanced Health Features"),
        FeaturedProduct(image: "watch-card-40-hermes", title: "Apple Watch Hermes", description: "Fashion Forward")
    ]
    
    static let categories: [(name: String, icon: String)] = [
        (name: "Apple Watch Bands", icon: "icon-watch-band"),
        (name: "Case & Protection", icon: "icon-watch-case"),
        (name: "Headphones & Speakers", icon: "icon-headphones"),
        (name: "Health & Fitness", icon: "icon-fitness"),
        (name : "Power & Cables", icon: "icon-powercables"),
        (name : "Stands", icon: "icon-stands"),
        (name : "Wireless Chargers", icon: "icon-wirelesschargers")
    ]
    
    static let x: Dictionary<String, Int> = [:]
}
