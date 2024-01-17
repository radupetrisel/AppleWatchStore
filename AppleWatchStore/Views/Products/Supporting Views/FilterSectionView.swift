//
//  FilterSectionView.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 25.10.2023.
//

import SwiftUI

struct FilterSectionView: View {
    @Binding var items: [ProductFilter]
    
    var body: some View {
        VStack {
            SectionHeader(title: items.first?.category.capitalized ?? "")
            LazyVGrid(columns: Constants.filterColumns, spacing: 10) {
                ForEach(items) { item in
                    sectionItem(item: item)
                }
            }
        }
        .padding(.horizontal)
    }
    
    func sectionItem(item: ProductFilter) -> some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 4)
                    .frame(width: 24, height: 24)
                
                Image(.customCheckmark)
            }
            
            Text(item.title)
                .condensed(.regular, size: 16)
            
            Spacer()
        }
        .onTapGesture {
            item.isSelected.toggle()
        }
    }
}

#Preview {
    FilterSectionView(items: .constant([]))
}
