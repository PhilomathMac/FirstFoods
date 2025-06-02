//
//  BabyData.swift
//  FirstFoods
//
//  Created by McKenzie Macdonald on 5/26/25.
//

import Foundation

struct FoodStatus {
    var timesTried: Int
    var babyPreference: FoodPreference
    
    init(timesTried: Int = 0, babyPreference: FoodPreference = FoodPreference.unknown) {
        self.timesTried = timesTried
        self.babyPreference = babyPreference
    }
}

struct BabyData {
    var name: String
    var dateStarted: Date
    var foodStatuses: [String: FoodStatus] = [:]
}

enum FoodPreference: String, CaseIterable, Codable, Identifiable, Hashable {
    var id: String { rawValue }
    
    case unknown = "❓"
    case loved = "❤️"
    case hated = "🤢"
    case neutral = "🫤"
}
