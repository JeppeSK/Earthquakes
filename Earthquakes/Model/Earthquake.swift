//
//  Earthquake.swift
//  Earthquakes
//
//  Created by dmu mac 20 on 15/05/2023.
//

import Foundation
import CoreLocation

struct Earthquake: Codable, Identifiable{
    let id = UUID().uuidString
    let properties: Properties
    let geometry: Geometry
    
    struct Properties: Codable {
        let mag: Double
        let place: String
        let time: Int64
//        let detail: URL
        
        var date: Date {
            return Date(milliseconds: time)
        }
    }
    
    struct Geometry: Codable {
        let coordinates: [Double]
    }
}

extension Date {
    init(milliseconds: Int64) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds) / 1000)
    }
}

extension Earthquake {
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: geometry.coordinates[1], longitude: geometry.coordinates[0])
    }
}
