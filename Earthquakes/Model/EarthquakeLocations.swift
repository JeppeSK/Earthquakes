//
//  EarthquakeLocations.swift
//  Earthquakes
//
//  Created by dmu mac 20 on 15/05/2023.
//

import Foundation
import MapKit

class EarthquakeLocations: ObservableObject {

    @Published var mapRect = MKMapRect()
    let earthquakes: [Earthquake]

    var size: Double = 100000
    var fullzoomed: Double = 100000

    init(earthquakes: [Earthquake]) {
        self.earthquakes = earthquakes;
    }
    
    func startingLocation() {
        let point = MKMapPoint(CLLocationCoordinate2D(latitude: 26.95235, longitude: -169.38414))
        mapRect = MKMapRect(origin: point, size: MKMapSize(width: fullzoomed * 10, height: fullzoomed * 10))
        
    }

    func fitToSingle() {
        let point = MKMapPoint(earthquakes[0].coordinate)
        mapRect = MKMapRect(origin: point, size: MKMapSize(width: size, height: size)).offsetBy(dx: -(size/2), dy: -(size/2))
    }
}
