//
//  TechPulseApp.swift
//  TechPulse
//
//  Created by RyanM on 8/7/24.
//

import SwiftUI
import SwiftData

@main
struct TechPulseApp: App {
    
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
            TechPulseMain()
        }
        .modelContainer(sharedModelContainer)
    }
}
