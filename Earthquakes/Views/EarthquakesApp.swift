//
//  EarthquakesApp.swift
//  Earthquakes
//
//  Created by dmu mac 20 on 15/05/2023.
//

import SwiftUI

@main
struct EarthquakesApp: App {
    
    @StateObject var stateController = StateController()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(stateController)
        }
    }
}
