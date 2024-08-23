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
    @State private var router = TechPulseRouter()
    
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
            NavigationStack(path: $router.path) {
                generate(screen: .login)
                    .navigationDestination(for: TechPulseScreen.self) { screen in
                        generate(screen: screen)
                    }
            }
        }
        .modelContainer(sharedModelContainer)
    }
    
    @ViewBuilder
    private func generate(screen: TechPulseScreen) -> some View {
        screen.view
            .environment(router)
    }
}


