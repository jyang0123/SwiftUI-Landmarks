//
//  ContentView.swift
//  Landmarks
//
//  Created on 7/5/23.
//

import SwiftUI

struct ContentView: View {
    // for tab selection and default value
    @State private var selection: Tab = .featured
    
    // add an enumeration tabs to display
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        // tab view, tag(_:) modifier each view
        TabView(selection: $selection) {
            CategoryHome()
                // label
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)
            
            LandmarkList()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
    }
}

//#Preview {
//    ContentView()
//}
struct ConetenView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
