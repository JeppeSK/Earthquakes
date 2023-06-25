//
//  EarthquakeDetailsResult.swift
//  Earthquakes
//
//  Created by dmu mac 20 on 17/05/2023.
//

import Foundation

struct EarthquakeDetailsResult: Codable {
    let features: [EarthquakeDetailsModel]
}
