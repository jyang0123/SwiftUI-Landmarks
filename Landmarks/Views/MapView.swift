//
//  MapView.swift
//  Landmarks
//
//  Created  on 7/8/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    @State private var region = MKCoordinateRegion()
//        center: CLLocationCoordinate2D(
//                latitude: 34.011_286,longitude: -116.166_868),
//        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
//    )
    
    var body: some View {
        // add an onAppear view modifier to the map
        // triggers a calculation of the region 
        Map(coordinateRegion: $region)
            .onAppear {
                setRegion(coordinate)
            }
    }
    
    // update the region based on a coordinate value
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}

//#Preview {
//    MapView(coordinate: <#T##CLLocationCoordinate2D#>(latitude: 34.011_286, longtitude: -116.166_868))
//}
