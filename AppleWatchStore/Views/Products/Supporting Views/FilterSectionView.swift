//
//  FilterSectionView.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 25.10.2023.
//

import SwiftUI

struct FilterSectionView: View {
    var body: some View {
        VStack {
            SectionHeader(title: "Section title here")
            LazyVGrid(columns: Constants.filterColumns, spacing: 10) {
                ForEach(0..<5, id: \.self) { item in
                    sectionItem
                }
            }
        }
        .padding(.horizontal)
    }
    
    var sectionItem: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 4)
                    .frame(width: 24, height: 24)
                
                Image(.check)
            }
            
            Text("Title goes here")
                .condensed(.regular, size: 16)
            
            Spacer()
        }
    }
}

#Preview {
    FilterSectionView()
}
