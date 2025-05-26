//
//  ContentView.swift
//  FirstFoods
//
//  Created by McKenzie Macdonald on 5/25/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            FoodImage()
            VStack(alignment: .leading) {
                Text("Carrot")
                    .font(.title)
                HStack {
                    Image(systemName: "gauge.with.dots.needle.bottom.0percent").font(.callout)
                    Image(systemName: "exclamationmark.octagon.fill").font(.callout)
                    Text("😃")
                }
            }
            Spacer()
        }
        .padding()
    }
}
#Preview {
    ContentView()
}
