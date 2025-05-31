//
//  ModelData.swift
//  FirstFoods
//
//  Created by McKenzie Macdonald on 5/26/25.
//

import Foundation

@Observable
class ModelData {
    var foods: [Food] = load("foodData.json")
    var baby = BabyData(name: "Elowyn", dateStarted: Date())
}


func load<T: Decodable>(_ fileName: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: fileName, withExtension: nil) else {
        fatalError("Couldn't find \(fileName) in main bundle")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(fileName) as Data: \(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Could not parse \(fileName) as \(T.self) : \(error)")
    }
}
