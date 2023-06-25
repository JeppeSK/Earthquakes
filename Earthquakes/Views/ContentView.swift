//
//  ContentView.swift
//  Earthquakes
//
//  Created by dmu mac 20 on 15/05/2023.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var stateController: StateController
    @State private var showOptions = false
    
    private var earthquakes : [Earthquake] {
        stateController.earthquakes.sorted {
            $0.properties.date < $1.properties.date
        }
    }
    
    var body: some View {
        TabView {
            NavigationView {
                List(earthquakes) { earthquake in
                    NavigationLink {
                        EarthquakeDetails(earthquake: earthquake)
                    } label: {
                        EarthquakeRowCell(earthquake: earthquake)
                    }
                    .listRowSeparator(.hidden)
                    .swipeActions(edge: .trailing) {
                        Button(action: {
                            stateController.add(earthquake)
                        }) {
                            Label("Save", systemImage:"square.and.arrow.down.fill")
                        }
                        .tint(.green)
                    }
                }
                .navigationTitle(Text("Earthquakes"))
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            showOptions = true
                        }) {
                            Image(systemName: "line.3.horizontal")
                        }
                    }
                }
                .actionSheet(isPresented: $showOptions) {
                    ActionSheet(title: Text("Select earthquake span"), buttons: [
                        .default(Text("Last hour")) {
                            stateController.changeSpan = .Hour
                        },
                        .default(Text("Last day")) {
                            stateController.changeSpan = .Day
                        },
                        .default(Text("Last week")) {
                            stateController.changeSpan = .Week
                        },
                        .default(Text("Last month")) {
                            stateController.changeSpan = .Month
                        },
                        .cancel()
                    ])
                }
            }
            .tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            PersistanceView()
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favorite")
            }
            EntireEarthquakeMap(earthquakeLocations: EarthquakeLocations(earthquakes: earthquakes))
                .tabItem {
                    Image(systemName: "map")
                    Text("Map")
            }
        }
        .tabViewStyle(DefaultTabViewStyle())
    }
}

 struct ContentView_Previews: PreviewProvider {
     static var previews: some View {
         ContentView().environmentObject(StateController())
     }
 }
 
