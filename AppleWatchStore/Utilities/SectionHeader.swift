//
//  SectionHeader.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 04.10.2023.
//

import SwiftUI

struct SectionHeader: View {
    var title: String
    var icon: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Text(title)
                    .condensedLowercased(.bold, size: 24)
                Spacer()
                if icon.isNotEmpty { Image(systemName: icon)}
            }
            
            Divider()
        }
    }
}

#Preview {
    VStack {
        SectionHeader(title: "Popular")
        SectionHeader(title: "Popular", icon: "slider.horizontal.3")
    }
}
