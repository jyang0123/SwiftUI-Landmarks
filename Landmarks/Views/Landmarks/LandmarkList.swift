//
//  LandmarkList.swift
//  Landmarks
//
//  Created on 7/18/23.
//

import SwiftUI

struct LandmarkList: View {
    // applied to a parent
    @EnvironmentObject var modelData: ModelData
    // State is a value, or a set of values for hold infor
    @State private var showFavoritesOnly = false
    // by checking the showFavoritesOnly property to compute filter
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                // Toggle view as first child
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                // use filtered version list
                // nested forEach group to transform the landmark into rows
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        // pass the current landmark to destination
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
    }
}

//struct LandmarkList_Previews: PreviewProvider {
//    static var previews: some View {
//        // using an array of devices names as the data
//        ForEach(["iPhone 14 Pro", "iPhone 12"], id: \.self) { deviceName in
//            LandmarkList()
//            // render at the size
//                .previewDevice(PreviewDevice(rawValue: deviceName))
//            // modifier to add the device names as labels
//                .previewDisplayName(deviceName)
//        }
//    }
//}

