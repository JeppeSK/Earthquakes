//
//  PersistanceView.swift
//  Earthquakes
//
//  Created by dmu mac 20 on 16/05/2023.
//

import SwiftUI

struct PersistanceView: View {
    
    @EnvironmentObject var stateController: StateController
    
    private var earthquakes : [Earthquake] {
        stateController.earthquakes.sorted {
            $0.properties.date < $1.properties.date
        }
    }
    var body: some View {
        NavigationView {
            List(stateController.favoriteEarthquakes) { earthquake in
                NavigationLink {
                    EarthquakeDetails(earthquake: earthquake)
                } label: {
                    EarthquakeRowCell(earthquake: earthquake)
                }
                .listRowSeparator(.hidden)
                .swipeActions(edge: .trailing) {
                    Button(action: {
                        stateController.delete(earthquake)
                    }) {
                        Label("Delete", systemImage:"trash")
                    }
                    .tint(.red)
                }
            }
            .navigationTitle(Text("Favorites"))
            }
        }
    }

struct PersistanceView_Previews: PreviewProvider {
    static var previews: some View {
        PersistanceView().environmentObject(StateController())
    }
}
