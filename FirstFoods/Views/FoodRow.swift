//
//  FoodRow.swift
//  FirstFoods
//
//  Created by McKenzie Macdonald on 5/26/25.
//

import SwiftUI

struct FoodRow: View {
    @Environment(ModelData.self) var modelData
    var food: Food
    var foodStatus: FoodStatus?
    @State private var isPreferencePopoverPresented: Bool = false
    
    var body: some View {
        Button {
            isPreferencePopoverPresented = true
        } label: {
            HStack {
                FoodImage(imageName: food.imageName)
                    .padding([.trailing])
                VStack(alignment: .leading) {
                    Text(food.name)
                        .font(.title2)
                    HStack {
                        TimesTriedSymbol(timesTried: foodStatus?.timesTried ?? 0)
                        Text(foodStatus?.babyPreference.rawValue ?? "❓")
                        if food.isAllergen {
                            Image(systemName: "exclamationmark.octagon.fill").font(.callout).foregroundStyle(.red)
                        }
                    }
                }
                Spacer()
            }
            .foregroundStyle(.black)
            .padding()
        }
        .popover(isPresented: $isPreferencePopoverPresented, attachmentAnchor: .point(.top),
                 arrowEdge: .bottom,) {
            HStack {
                ForEach(FoodPreference.allCases) { preference in
                    Button {
                        incrementFoodCount(for: food, with: preference)
                    } label: {
                        Text(preference.rawValue)
                    }

                }
            }
                    .frame(minWidth: 300, maxHeight: 400)
                    .presentationCompactAdaptation(.popover)
        }

    }
    
    func incrementFoodCount(for food: Food, with preference: FoodPreference) {
        var status = modelData.baby.foodStatuses[food.id] ?? FoodStatus()
        status.timesTried += 1
        status.babyPreference = preference
        modelData.baby.foodStatuses[food.id] = status
        isPreferencePopoverPresented = false
    }
}


#Preview {
    FoodRow(food: ModelData().foods[36]).environment(ModelData())
}

#Preview {
    FoodRow(food: ModelData().foods[20]).environment(ModelData())
}
