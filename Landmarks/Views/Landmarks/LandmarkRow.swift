//
//  LandmarkRow.swift
//  Landmarks
//
//  Created on 7/17/23

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)

            Text(landmark.name)

            Spacer()
            // test whether the current landmark is a favorite
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                // change star color
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct LandmarksRow_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks
    
    static var previews: some View {
        Group {
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}

//#Preview {
//    LandmarkRow()
//}
