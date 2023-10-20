//
//  Text+Extensions.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 13.10.2023.
//

import SwiftUI

extension Text {
    func ultraLight(ofSize size: CGFloat = 14) -> Text {
        let condensed = UIFont.systemFont(ofSize: size, weight: .ultraLight, width: .condensed)
        return self.font(Font(condensed))
    }
    
    func heavy(ofSize size: CGFloat = 60) -> Text {
        let condensed = UIFont.systemFont(ofSize: size, weight: .heavy, width: .condensed)
        return self.font(Font(condensed))
    }
}
