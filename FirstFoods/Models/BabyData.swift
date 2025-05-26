//
//  BabyData.swift
//  FirstFoods
//
//  Created by McKenzie Macdonald on 5/26/25.
//

import Foundation

let possiblePreferences = ["?", "❤️", "🤢", "🫤"]

struct FoodStatus {
    var timesTried = 0
    var babyPreference = possiblePreferences[0]
}

struct BabyData {
    var name: String
    var dateStarted: Date
    var foodStatus: [String: FoodStatus] = [:]
}

let baby = BabyData(name: "Elowyn", dateStarted: Date())
