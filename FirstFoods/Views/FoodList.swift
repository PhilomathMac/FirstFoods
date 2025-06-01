//
//  FoodList.swift
//  FirstFoods
//
//  Created by McKenzie Macdonald on 5/26/25.
//

import SwiftUI

struct FoodList: View {
    @Environment(ModelData.self) var modelData
    @State var selectedCategory: FoodCategory?
    @State var searchText = ""

    var filteredFoods: [Food] {
        modelData.foods.filter { food in
            if selectedCategory == nil && searchText.isEmpty { return true }
            if selectedCategory == nil {
                return searchText.isEmpty
                    || food.name.lowercased().contains(searchText.lowercased())
            } else {
                return selectedCategory == food.category && (searchText.isEmpty || food.name.lowercased().contains(searchText.lowercased()))
            }
        }
    }

    var body: some View {
        NavigationStack {
            List {
                ForEach(filteredFoods) { food in
                    FoodRow(
                        food: food,
                        foodStatus: modelData.baby.foodStatuses[food.id]
                    )
                    .swipeActions(edge: .trailing) {
                        Button(
                            action: {
                                changeFoodCount(for: food, adding: true)
                            },
                            label: {
                                Image(systemName: "plus")
                            }
                        )
                        .tint(.green)
                    }
                    .swipeActions(edge: .leading) {
                        Button(
                            action: {
                                changeFoodCount(for: food, adding: false)
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
            //            .toolbar {
            //                Menu {
            //                    ForEach(FoodCategory.allCases) { category in
            //                        Button {
            //                            if selectedCategories.contains(category) {
            //                                selectedCategories.remove(category)
            //                            } else {
            //                                selectedCategories.insert(category)
            //                            }
            //                        } label: {
            //                            HStack {
            //                                Text(category.rawValue)
            //                                if selectedCategories.contains(category) {
            //                                    Image(systemName: "checkmark")
            //                                }
            //                            }
            //                        }
            //
            //                    }
            //                } label: {
            //                    Image(systemName: "line.3.horizontal.decrease.circle")
            //                        .font(.title)
            //                }
            //                .menuActionDismissBehavior(.disabled)
            //            }
        }
        .searchable(text: $searchText)
        .searchScopes($selectedCategory) {
            ForEach(FoodCategory.allCases, id: \.self) { category in
                Text(category.emoji).tag(category)
            }
        }
    }

    func changeFoodCount(for food: Food, adding: Bool) {
        var status = modelData.baby.foodStatuses[food.id] ?? FoodStatus()
        if adding {
            status.timesTried += 1
        } else {
            if status.timesTried > 0 {
                status.timesTried -= 1
            }
        }
        modelData.baby.foodStatuses[food.id] = status
    }
}

#Preview {
    FoodList()
        .environment(ModelData())
}
