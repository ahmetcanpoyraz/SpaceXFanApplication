//
//  SpaceXFanApplicationApp.swift
//  SpaceXFanApplication
//
//  Created by İzmir İnovasyon ve Teknoloji on 9.12.2024.
//

import SwiftUI

@main
struct SpaceXFanApplicationApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
