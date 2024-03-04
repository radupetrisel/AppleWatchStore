//
//  ProductFilterTip.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 04.03.2024.
//

import Foundation
import SwiftUI
import TipKit

struct ProductFilterTip: Tip {
    static let productSteps: Event = Event<Tips.EmptyDonation>(id: "tip.event.product-steps")
    
    var id: String {
        "tip.identifier.product-filter"
    }
    
    var title: Text {
        Text("Here you can filter products.")
    }
    
    var message: Text? {
        Text("Tap the icon to display filter options.")
    }
    
    var image: Image? {
        Image(systemName: "slider.horizontal.3")
    }
    
    var actions: [Action] {
        [
            Tip.Action(id: "action.title.dismiss", title: "Dismiss")
        ]
    }
    
    var rules: [Rule] {
        [
            #Rule(Self.productSteps) { $0.donations.count == 1 }
        ]
    }
    
    var options: [TipOption] { [Tips.MaxDisplayCount(1)] }
}
