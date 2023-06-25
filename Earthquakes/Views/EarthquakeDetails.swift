//
//  EarthquakeDetails.swift
//  Earthquakes
//
//  Created by dmu mac 20 on 16/05/2023.
//

import SwiftUI

struct EarthquakeDetails: View {
    
    let earthquake: Earthquake
    @State private var showDetails = false
    
    var body: some View {
        VStack {
            HStack  {
                Text(" \(earthquake.properties.place) ").font(.title2)
            }
            EarthquakeMap(earthquakeLocations: EarthquakeLocations(earthquakes: [earthquake]))
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    showDetails = true
                }) {
                    Image(systemName: "info.circle")
                }
            }
        }
        .sheet(isPresented: $showDetails) {
            EarthquakeInformation(earthquake: earthquake)
        }
        .background(changeColorAccordingToMag())
    }
    
    func changeColorAccordingToMag() -> Color {
        if (5 > earthquake.properties.mag && earthquake.properties.mag > 3) {
            return Color.yellow
        }
        else if (earthquake.properties.mag >= 5) {
            return Color.red
        }
        return Color.green
    }
}


struct EarthquakeDetails_Previews: PreviewProvider {
    static var previews: some View {
        EarthquakeDetails(earthquake: Earthquake(properties: Earthquake.Properties(mag: 6, place: "New York", time: 13), geometry: Earthquake.Geometry(coordinates: [-50.3695, -92.2983])))
    }
}
