//
//  FoodRow.swift
//  FirstFoods
//
//  Created by McKenzie Macdonald on 5/26/25.
//

import SwiftUI

struct FoodRow: View {
    var food: Food
    
    var body: some View {
        HStack {
            FoodImage(imageName: food.imageName)
            VStack(alignment: .leading) {
                Text(food.name)
                    .font(.title)
                HStack {
                    Image(systemName: "gauge.with.dots.needle.bottom.0percent").font(.callout)
                    Text("😃")
                    if food.isAllergen {
                        Image(systemName: "exclamationmark.octagon.fill").font(.callout).foregroundStyle(.red)
                    }
                }
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    FoodRow(food: foods[36])
}

#Preview {
    FoodRow(food: foods[20])
}
