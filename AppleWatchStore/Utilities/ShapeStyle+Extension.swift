//
//  ShapeStyle+Extension.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 04.10.2023.
//

import Foundation
import SwiftUI

extension ShapeStyle where Self == Gradient {
    static var gradient: Gradient {
        Gradient(stops: [
            .init(color: .baseGradientTop, location: 0.2),
            .init(color: .baseGradientBottom, location: 0.5)])
    }
}
