//
//  CategoryHome.swift
//  Landmarks
//
//  Created on 7/22/23.

import SwiftUI

struct CategoryHome: View {
    // access to categories and other landmark data
    @EnvironmentObject var modelData: ModelData
    @State private var showingProfile = false
    
    var body: some View {
        // to host diff categories
        NavigationView {
            // display the categories
            List {
                PageView(pages: modelData.features.map { FeatureCard(landmark: $0) })
                    .aspectRatio(3 / 2, contentMode: .fit)
                    // set the edge insets to zero
                    .listRowInsets(EdgeInsets())
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    // pass category infor to instances of the row type
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            // to pick a list style
            .listStyle(.inset)
            
            .navigationTitle("Features")
            // add user profile button to navigation bar
            .toolbar {
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
            }
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
                    .environmentObject(modelData)
            }
        }
    }
}

//#Preview {
//    CategoryHome()
//}
struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
