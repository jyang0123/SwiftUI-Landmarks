//
//  CategoryRow.swift
//  Landmarks
//
//  Created on 7/22/23.
//

import SwiftUI

// display all the landmarks for that category in the new view
struct CategoryRow: View {
    // add properties
    var categoryName: String
    var items: [Landmark]
    
    var body: some View {
        // items in HStack andname in a VStack
        VStack(alignment: .leading) {
            // display the name of the category
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { landmark in
                        // wrap the existing CategoryItem
                        NavigationLink {
                            LandmarkDetail(landmark: landmark)
                        } label: {
                            CategoryItem(landmark: landmark)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

//#Preview {
//    CategoryRow()
//}
struct CategoryRow_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks
    
    static var previews: some View {
        CategoryRow(
            categoryName: landmarks[0].category.rawValue,
            items: Array(landmarks.prefix(4))
        )
    }
}
