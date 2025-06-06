//
//  FoodList.swift
//  FirstFoods
//
//  Created by McKenzie Macdonald on 5/26/25.
//

import SwiftUI

struct FoodList: View {
    @Environment(ModelData.self) var modelData
    @State var selectedCategory: FoodCategory = .all
    @State var searchText = ""

    var filteredFoods: [Food] {
        modelData.foods.filter { food in
            if selectedCategory == .all && searchText.isEmpty { return true }
            if selectedCategory == .all {
                return searchText.isEmpty
                    || food.name.lowercased().contains(searchText.lowercased())
            } else {
                return selectedCategory == food.category && (searchText.isEmpty || food.name.lowercased().contains(searchText.lowercased()))
            }
        }
    }

    var body: some View {
        NavigationStack {
            if (filteredFoods.isEmpty) {
                VStack(alignment: .center) {
                    Text("No matching foods found")
                }
                .padding(.top)
            }
            List {
                ForEach(filteredFoods) { food in
                    FoodRow(
                        food: food,
                        foodStatus: modelData.baby.foodStatuses[food.id]
                    )
                    .swipeActions(edge: .leading) {
                        Button(
                            action: {
                                decrementFoodCount(for: food)
                            },
                            label: {
                                Image(systemName: "minus")
                            }
                        )
                        .tint(.red)
                    }
                }
            }
            .navigationTitle("Baby's First Foods")
        }
        .searchable(text: $searchText)
        .searchScopes($selectedCategory, activation: .onSearchPresentation) {
            ForEach(FoodCategory.allCases, id: \.self) { category in
                Text(category.emoji).tag(category)
            }
        }
    }

    func decrementFoodCount(for food: Food) {
        var status = modelData.baby.foodStatuses[food.id] ?? FoodStatus()
            if status.timesTried > 0 {
                status.timesTried -= 1
            }
        if status.timesTried <= 0 {
            status.babyPreference = FoodPreference.unknown
        }
        modelData.baby.foodStatuses[food.id] = status
    }
}

#Preview {
    FoodList()
        .environment(ModelData())
}
