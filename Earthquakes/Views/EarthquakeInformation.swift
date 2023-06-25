//
//  EarthquakeInformation.swift
//  Earthquakes
//
//  Created by dmu mac 20 on 16/05/2023.
//

import SwiftUI

struct EarthquakeInformation: View {
    
    let earthquake: Earthquake
    
    var body: some View {
        VStack {
            EarthquakeMap(earthquakeLocations: EarthquakeLocations(earthquakes: [earthquake]))
                .frame(width: 400, height: 300, alignment: .top)
            
            VStack(alignment: .leading) {
                Text("Magnitude: \(String(format: "%.1f", earthquake.properties.mag))").font(.title)
                Text("Area: \(earthquake.properties.place)").font(.title2)
                Text("Happent at: \(earthquake.properties.date.formatted(.dateTime.weekday().day().month().year().hour().minute()))").font(.title2)
            }
            .padding()
            Spacer()
        }
    }
}


struct EarthquakeInformation_Previews: PreviewProvider {
    static var previews: some View {
        EarthquakeInformation(earthquake: Earthquake(properties: Earthquake.Properties(mag: 7.2, place: "New York", time: 13), geometry: Earthquake.Geometry(coordinates: [-50.3695, -92.2983])))
    }
}
