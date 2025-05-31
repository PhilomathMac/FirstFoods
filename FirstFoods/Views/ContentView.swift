//
//  ContentView.swift
//  FirstFoods
//
//  Created by McKenzie Macdonald on 5/25/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        FoodList()
    }
}
#Preview {
    ContentView()
        .environment(ModelData())
}
