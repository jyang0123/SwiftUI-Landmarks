//
//  ModelData.swift
//  Landmarks
//
//  Created on 7/17/23.


import Foundation
import Combine

// a new model type that conforms to the ObservableObject
final class ModelData: ObservableObject {
    //publish data for subscriber can pick up the change
    @Published var landmarks: [Landmark] = load("landmarkData.json")
    // load hikes array into model object
    var hikes: [Hike] = load("hikeData.json")
    @Published var profile = Profile.default
    
    // add a new computed features array
    var features: [Landmark] {
        landmarks.filter { $0.isFeatured}
    }
    
    // add a computed categories dictionary, and an array of associated lanmarks for each key
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarks,
            by: { $0.category.rawValue }
        )
    }
}


// this method fetches JSON data with a given name form the app's main bundle
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle. ")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
