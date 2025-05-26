//
//  FoodImage.swift
//  FirstFoods
//
//  Created by McKenzie Macdonald on 5/25/25.
//

import SwiftUI

struct FoodImage: View {
    var body: some View {
        Image("carrot")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(.circle)
            .frame(width: 100)
    }
}

#Preview {
    FoodImage()
}
