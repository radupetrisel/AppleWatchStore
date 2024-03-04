//
//  AddProductReview.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 19.11.2023.
//

import SwiftUI

struct AddProductReview: View {
    @Environment(\.dismiss) var dismiss
    @Environment(DataManager.self) var dataManager
    
    @State private var rating: Float = 3
    @State private var reviewSummary = ""
    @State private var title = ""
    @State private var name = ""
    
    let product: Product
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Title", text: $title)
                    TextField("Your name", text: $name)
                }
                
                Section {
                    TextEditor(text: $reviewSummary)
                    
                    RatingView(rating: $rating)
                } header: {
                    Text("Write a review")
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        withAnimation {
                            let data = ReviewData(title: title, summary: reviewSummary, name: name, rating: rating)
                            dataManager.addProductReview(product: product, data: data)
                            
                            dismiss()
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    AddProductReview(product: .default)
}
