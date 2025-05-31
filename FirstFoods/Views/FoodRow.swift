//
//  FoodRow.swift
//  FirstFoods
//
//  Created by McKenzie Macdonald on 5/26/25.
//

import SwiftUI

struct FoodRow: View {
    var food: Food
    var foodStatus: FoodStatus?
    
    var body: some View {
        HStack {
            FoodImage(imageName: food.imageName)
                .padding([.trailing])
            VStack(alignment: .leading) {
                Text(food.name)
                    .font(.title2)
                HStack {
                    TimesTriedSymbol(timesTried: foodStatus?.timesTried ?? 0)
                    Text(foodStatus?.babyPreference ?? "❓")
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
    FoodRow(food: ModelData().foods[36])
}

#Preview {
    FoodRow(food: ModelData().foods[20])
}
