//
//  FoodList.swift
//  FirstFoods
//
//  Created by McKenzie Macdonald on 5/26/25.
//

import SwiftUI

struct FoodList: View {
    @State var selectedCategories: Set<FoodCategory> = [.vegetable]
    
    var filteredFoods : [Food] {
        foods.filter { food in
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
                    FoodRow(food: food)
                        .swipeActions(edge:.trailing) {
                            Button(action: {
                                // Increment how many times baby has had food
                            }, label: {
                                Image(systemName: "plus")
                            })
                            .tint(.green)
                        }
                        .swipeActions(edge:.leading) {
                            Button(action: {
                                // Decrement how many times baby has had food
                            }, label: {
                                Image(systemName: "minus")
                            })
                            .tint(.red)
                        }
                }
            }
        }
    }
}

#Preview {
    FoodList()
}
