//
//  EarthquakeRowCell.swift
//  Earthquakes
//
//  Created by dmu mac 20 on 15/05/2023.
//

import SwiftUI

struct EarthquakeRowCell: View {
    
    let earthquake: Earthquake
    
    var body: some View {
        HStack {
            Image(systemName: "globe.americas").font(.title)
                .padding(EdgeInsets(top: 0.1, leading: 10, bottom: 0, trailing: 0))
            
            Text(" \(String(format: "%.1f", max(0.1, earthquake.properties.mag)))").font(.title2)
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text("\(earthquake.properties.date.formatted(.dateTime.weekday().day().month().year().hour().minute())) \(earthquake.properties.place)")
            }
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10))
        }
        .frame(width: 330, height: 80)
        .background(Color.yellow)
        .cornerRadius(10)
    }
}

/*
struct EarthquakeRowCell_Previews: PreviewProvider {
    static var previews: some View {
        EarthquakeRowCell(earthquake: Earthquake(properties: Earthquake.Properties(mag: 7.2, place: "New York", time: 13), geometry: Earthquake.Geometry(coordinates: [-50.3695, -92.2983])))
    }
}
 */


