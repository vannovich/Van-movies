//
//  BlossomMovieApp.swift
//  BlossomMovie
//
//  Created by USER on 25/09/2026.
//

import SwiftUI
import SwiftData

@main
struct BlossomMovieApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Title.self)
    }
}
