//
//  LandmarksApp.swift
//  Landmarks
//
//  Created  on 7/5/23.
//

import SwiftUI

@main
struct LandmarksApp: App {
    // use the @StateObject sttribute to initialize a model
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
