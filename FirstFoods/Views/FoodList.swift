//
//  FoodList.swift
//  FirstFoods
//
//  Created by McKenzie Macdonald on 5/26/25.
//

import SwiftUI

struct FoodList: View {
    @Environment(ModelData.self) var modelData
    @State var selectedCategories: Set<FoodCategory> = []
    
    var filteredFoods : [Food] {
        modelData.foods.filter { food in
            selectedCategories.isEmpty || selectedCategories.contains(food.category)
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                
                Text("Baby's First Foods")
                    .font(.title)
                Spacer()
                Menu {
                    ForEach(FoodCategory.allCases) { category in
                        Button {
                            if selectedCategories.contains(category) {
                                selectedCategories.remove(category)
                            } else {
                                selectedCategories.insert(category)
                            }
                        } label: {
                            HStack {
                                Text(category.rawValue)
                                if (selectedCategories.contains(category)) {
                                    Image(systemName: "checkmark")
                                }
                            }
                        }
                        
                    }
                } label: {
                    Image(systemName: "line.3.horizontal.decrease.circle")
                        .font(.title)
                }
                .menuActionDismissBehavior(.disabled)
            }
            .padding()
            List{
                ForEach(filteredFoods) { food in
                    FoodRow(food: food, foodStatus: modelData.baby.foodStatuses[food.id])
                        .swipeActions(edge:.trailing) {
                            Button(action: {
                                changeFoodCount(for: food, adding: true)
                            }, label: {
                                Image(systemName: "plus")
                            })
                            .tint(.green)
                        }
                        .swipeActions(edge:.leading) {
                            Button(action: {
                                changeFoodCount(for: food, adding: false)
                            }, label: {
                                Image(systemName: "minus")
                            })
                            .tint(.red)
                        }
                }
            }
        }
    }
    
    func changeFoodCount(for food: Food, adding: Bool) {
        var status = modelData.baby.foodStatuses[food.id] ?? FoodStatus()
        if (adding) {
            status.timesTried += 1
        } else {
            if (status.timesTried > 0) {
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
