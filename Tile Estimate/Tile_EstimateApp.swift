//
//  Tile_EstimateApp.swift
//  Tile Estimate
//
//  Created by Gwynneth Isviandhy on 26/04/24.
//

import SwiftUI
import SwiftData

@main
struct Tile_EstimateApp: App {
    @State private var hist = false
    @State private var isActive = false
    var historyManager = HistoryManager()

    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
                    if isActive {
                        ContentView(hist: $hist, isActive: $isActive)
                            .modelContainer(for: Item.self, inMemory: true)
                            .environmentObject(historyManager) 

                    } else {
                        splashScreenView(isActive: $isActive)
                    }
                }
        .modelContainer(sharedModelContainer)
    }
}
