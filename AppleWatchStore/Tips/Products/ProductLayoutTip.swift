//
//  ProductLayoutTip.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 04.03.2024.
//

import Foundation
import SwiftUI
import TipKit

struct ProductLayoutTip: Tip {
    var title: Text {
        Text("Here you can switch layouts.")
    }
    
    var message: Text? {
        Text("Toggle between list and grid views.")
    }
    
    var image: Image? {
        Image(systemName: "rectangle.grid.1x2.fill")
    }
    
    var actions: [Action] {
        [
            Tip.Action(id: "next-button", title: "Next Tip")
        ]
    }
}
