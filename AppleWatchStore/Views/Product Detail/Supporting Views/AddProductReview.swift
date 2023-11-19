//
//  AddProductReview.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 19.11.2023.
//

import SwiftUI

struct AddProductReview: View {
    @State private var rating: Float = 3
    @State private var reviewSummary = ""
    @State private var title = ""
    @State private var name = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Title", text: $title)
                    TextField("Your name", text: $name)
                }
                
                Section {
                    TextEditor(text: $reviewSummary)
                    
                    HStack {
                        ForEach(0..<5) { item in
                            Image(systemName: "star")
                                .symbolVariant(.fill)
                        }
                    }
                } header: {
                    Text("Write a review")
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") { }
                }
            }
        }
    }
}

#Preview {
    AddProductReview()
}
