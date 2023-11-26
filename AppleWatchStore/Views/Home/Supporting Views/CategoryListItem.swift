//
//  CategoryListItem.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 20.10.2023.
//

import SwiftUI

struct CategoryListItem: View {
    var item: (name: String, icon: String)
    
    var body: some View {
        VStack(spacing: 3) {
            HStack {
                HStack {
                    Image(item.icon)
                        .resizable()
                        .frame(width: 32, height: 29)
                    
                    Text(item.name)
                        .condensed(.light, size: 16)
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
            }
            
            Divider()
        }
        .padding(.horizontal)
    }
}

#Preview {
    CategoryListItem(item: (name: "Health and Fitness", icon: "icon-fitness"))
}
