//
//  CustomButtonStyle.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 10.10.2023.
//

import SwiftUI

struct CustomButtonStyle: ButtonStyle {
    var background: Color = .black
    var border: Color = .clear
    var radius: CGFloat = 4
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(.horizontal, 5)
            .padding(.vertical, 8)
            .background(background)
            .clipShape(.rect(cornerRadius: radius))
            .buttonStyle(.plain)
            .overlay(
                RoundedRectangle(cornerRadius: radius)
                    .stroke(border, lineWidth: 1)
            )
    }
}
