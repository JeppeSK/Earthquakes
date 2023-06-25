//
//  EarthquakeDetailsModel.swift
//  Earthquakes
//
//  Created by dmu mac 20 on 17/05/2023.
//

import Foundation

import Foundation

struct EarthquakeDetailsModel: Codable, Identifiable {
    let id = UUID().uuidString
    let properties: Properties
    let geometry: Geometry
    
    struct Geometry: Codable {
        let coordinates: [Double]
    }
    
    struct Properties: Codable {
        let mag: Double
        let place: String
        let time: Int64
    }
}
