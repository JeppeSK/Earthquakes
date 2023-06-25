//
//  StateController.swift
//  Earthquakes
//
//  Created by dmu mac 20 on 15/05/2023.
//

import SwiftUI

@MainActor class StateController: ObservableObject {
    @Published var earthquakes: [Earthquake] = []
    @Published var earthquakeDetails: [EarthquakeDetailsModel] = []
    
    @Published var favoriteEarthquakes: [Earthquake] = []
    
    @Published var changeSpan: EarthquakeSpan = .Day {
        didSet {
            getEarthquakes()
        }
    }
    
    let saveKey = "SavedData"
    
    init() {
        getEarthquakes()
        
        if let data = UserDefaults.standard.data(forKey: saveKey) {
            if let decoded = try? JSONDecoder().decode([Earthquake].self, from: data) {
                favoriteEarthquakes = decoded
                return
            }
        }
        favoriteEarthquakes = []
    }
    
    private func save() {
        if let encoded = try? JSONEncoder().encode(favoriteEarthquakes) {
            UserDefaults.standard.set(encoded, forKey: saveKey)
        }
    }
    
    func add(_ earthquake: Earthquake) {
        favoriteEarthquakes.append(earthquake)
        save()
    }
    
    func delete(_ earthquake: Earthquake) {
        if let index = favoriteEarthquakes.firstIndex(where: { $0.id == earthquake.id }) {
            favoriteEarthquakes.remove(at: index)
            save()
        }
    }
    
    /*
    func getNeceecaryDetails(_ earthquake: Earthquake) {
        if let index = earthquakes.firstIndex(where: { $0.id == earthquake.id }) {
            getDetailsData(url: earthquake.properties.detail)
        }
    }
    */
    
    public func getDetailsData(url: URL) {
        Task {
            guard let rawData = await NetworkService.getData(from: url) else { return }
            let decoder = JSONDecoder()
            do {
                let result = try decoder.decode(EarthquakeDetailsResult.self, from: rawData)
                earthquakeDetails = result.features
            } catch {
                fatalError("Konvertering fra JSON gik galt")
            }
        }
    }
    
    public func getEarthquakes(){
        guard let url = URL(string: changeSpan.rawValue) else { return }
        
        Task {
            guard let rawData = await NetworkService.getData(from: url) else {return}
            let decoder = JSONDecoder()
            do {
                let result = try decoder.decode(EarthquakeResult.self, from: rawData)
                earthquakes = result.features
            } catch {
                fatalError("Konvertering fra JSON gik galt")
            }
        }
    }
}
