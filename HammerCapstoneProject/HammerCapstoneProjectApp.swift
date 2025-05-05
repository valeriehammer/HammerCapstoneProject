//
//  HammerCapstoneProjectApp.swift
//  HammerCapstoneProject
//
//  Created by Valerie Hammer on 5/5/25.
//

import SwiftUI
import SwiftData

@main
struct HammerCapstoneProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [GratefulMoment.self, EmotionReflection.self, LessonsLearned.self])
        }

    }
}

// Useful video for Swift Data https: www.hackingwithswift.com/books/ios-swiftui/introduction-to-swiftdata-and-swiftui
