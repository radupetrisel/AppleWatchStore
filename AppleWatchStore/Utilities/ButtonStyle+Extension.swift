//
//  ButtonStyle+Extension.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 10.10.2023.
//

import SwiftUI

extension ButtonStyle where Self == CustomButtonStyle {
    static var customBordered: Self {
        .init(background: .baseLightGray, radius: 6)
    }
    
    static var customBorderedBlack: Self {
        .init(background: .baseBlack, radius: 6)
    }
}
