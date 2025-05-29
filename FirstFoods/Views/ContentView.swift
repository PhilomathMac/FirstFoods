//
//  ContentView.swift
//  FirstFoods
//
//  Created by McKenzie Macdonald on 5/25/25.
//

import SwiftUI

struct ContentView: View {
    @State var selectedCategories: Set<FoodCategory> = []
    
    var body: some View {
        FoodList()
    }
}
#Preview {
    ContentView()
}
