//
//  BabyData.swift
//  FirstFoods
//
//  Created by McKenzie Macdonald on 5/26/25.
//

import Foundation

let possiblePreferences = ["❓", "❤️", "🤢", "🫤"]

struct FoodStatus {
    var timesTried = 0
    var babyPreference = possiblePreferences[0]
    
    init(timesTried: Int = 0, babyPreference: String = possiblePreferences[0]) {
        self.timesTried = timesTried
        self.babyPreference = babyPreference
    }
}

struct BabyData {
    var name: String
    var dateStarted: Date
    var foodStatuses: [String: FoodStatus] = [:]
}
