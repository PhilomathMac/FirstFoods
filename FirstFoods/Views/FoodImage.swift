//
//  FoodImage.swift
//  FirstFoods
//
//  Created by McKenzie Macdonald on 5/25/25.
//

import SwiftUI

struct FoodImage: View {
    var imageName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFill()
            .frame(width: 75, height: 75)
            .clipShape(.circle)
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

#Preview {
    VStack {
        FoodImage(imageName: "carrot")
        FoodImage(imageName: "apple")
        FoodImage(imageName: "oats")
    }
}
