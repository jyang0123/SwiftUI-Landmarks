//
//  Landmark.swift
//  Landmarks
//
//  Created on 7/17/23.
//

import Foundation
import SwiftUI
import CoreLocation

// Identifiable property to decode it when reading the data
struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    // addd top of the view
    var isFeatured: Bool
    
    // category enumeration
    var category: Category
    enum Category: String, CaseIterable, Codable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
    
    // loads an image from the asset catalog
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    // add computed property.     // if the feature image exists, return
    var featureImage: Image? {
        isFeatured ? Image(imageName + "_feature") : nil
    }
    
    // reflects the storage in the JSON data structure
    private var coordinates: Coordinates
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
    
    // interacting with the MapKit framework
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
}
