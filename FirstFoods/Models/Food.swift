//
//  Food.swift
//  FirstFoods
//
//  Created by McKenzie Macdonald on 5/26/25.
//

import SwiftUICore

struct Food: Identifiable, Codable {
    var id: String
    var name: String
    var isAllergen: Bool
    var category: FoodCategory
    
    var imageName: String {
        name.lowercased().replacingOccurrences(of: " ", with: "_")
    }
}

enum FoodCategory: String, CaseIterable, Codable, Identifiable, Hashable {
    var id: String { rawValue }
    
    case all
    case fruit
    case vegetable
    case nut
    case meat
    case dairy
    case grain
    case other
    
    var emoji: String {
        switch self {
        case .all:
            return "All"
        case .fruit:
            return "🍎"
        case .vegetable:
            return "🥕"
        case .nut:
            return "🥜"
        case .meat:
            return "🍗"
        case .dairy:
            return "🥛"
        case .grain:
            return "🌾"
        case .other:
            return "❓"
        }
    }
}
