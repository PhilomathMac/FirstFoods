//
//  FoodList.swift
//  FirstFoods
//
//  Created by McKenzie Macdonald on 5/26/25.
//

import SwiftUI

struct FoodList: View {
    var body: some View {
        List(foods) { food in
            FoodRow(food: food)
        }
    }
}

#Preview {
    FoodList()
}
