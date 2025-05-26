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
    
    var imageName: String {
        name.lowercased().replacingOccurrences(of: " ", with: "_")
    }
}
