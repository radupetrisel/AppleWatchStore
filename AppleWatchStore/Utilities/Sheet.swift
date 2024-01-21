//
//  Sheet.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 21.01.2024.
//

import SwiftUI

struct Sheet: View {
    let sheetType: SheetType
    
    var body: some View {
        make()
    }
    
    @ViewBuilder
    private func make() -> some View {
        switch sheetType {
        case .filter:
            FilterView()
        }
    }
}

extension Sheet {
    enum SheetType: Identifiable {
        case filter
        
        var id: String {
            switch self {
            case .filter:
                return "filter"
            }
        }
    }
}
