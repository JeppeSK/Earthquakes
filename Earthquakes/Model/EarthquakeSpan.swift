//
//  EarthquakeSpan.swift
//  Earthquakes
//
//  Created by dmu mac 20 on 15/05/2023.
//

enum EarthquakeSpan: String {
    case Hour =
            "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_hour.geojson"
    case Day =
            "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson"
    case Week =
            "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_week.geojson"
    case Month =
            "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.geojson"
}
