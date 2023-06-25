//
//  EntireEarthquakeMap.swift
//  Earthquakes
//
//  Created by dmu mac 20 on 17/05/2023.
//

import SwiftUI
import MapKit

struct EntireEarthquakeMap: View {
    @EnvironmentObject private var stateController: StateController
    @ObservedObject var earthquakeLocations: EarthquakeLocations
    
    
    var body: some View {
        Map(mapRect: $earthquakeLocations.mapRect, annotationItems: stateController.earthquakes) { earthquakes in MapMarker(coordinate: earthquakes.coordinate, tint: .blue)
        }.task {
            earthquakeLocations.startingLocation()
        }
        .ignoresSafeArea()
    }
}


struct EntireEarthquakeMap_Previews: PreviewProvider {
    static var previews: some View {
        EntireEarthquakeMap(earthquakeLocations: EarthquakeLocations(earthquakes: [Earthquake(properties: Earthquake.Properties(mag: 7.2, place: "New York", time: 13), geometry: Earthquake.Geometry(coordinates: [-50.3695, -92.2983]))])).environmentObject(StateController())
    }
}
