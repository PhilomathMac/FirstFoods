//
//  FoodList.swift
//  FirstFoods
//
//  Created by McKenzie Macdonald on 5/26/25.
//

import SwiftUI

struct FoodList: View {
    var body: some View {
        List{
            ForEach(foods) { food in
                FoodRow(food: food)
                    .swipeActions(edge:.trailing) {
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "plus")
                        })
                        .tint(.green)
                    }
                    .swipeActions(edge:.leading) {
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "minus")
                        })
                        .tint(.red)
                    }
            }
        }
    }
}

#Preview {
    FoodList()
}
