//
//  RatingView.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 04.03.2024.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Float
    
    var text = ""
    var maxRating = 5
    
    var offImage: Image?
    var onImage: Image = Image(systemName: "star.fill")
    
    var body: some View {
        HStack {
            if text.isNotEmpty {
                Text(text)
            }
            
            ForEach(1 ... maxRating, id: \.self) { num in
                image(for: Float(num))
                    .foregroundStyle(num > Int(rating) ? .baseRatingOff : .baseRatingOn)
                    .onTapGesture { rating = Float(num) }
            }
        }
    }
    
    func image(for number: Float) -> Image {
        if number > rating {
            offImage ?? onImage
        } else {
            onImage
        }
    }
}

#Preview {
    RatingView(rating: .constant(4))
}
