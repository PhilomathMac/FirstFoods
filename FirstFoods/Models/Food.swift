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
    
    private var imageName: String
        var image: Image {
            Image(imageName)
    }
}
