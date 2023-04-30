//
//  Bookmark_collectorApp.swift
//  Bookmark collector
//
//  Created by Nursat Sakyshev on 04.04.2023.
//

import SwiftUI

enum AppScreenState {
    case onboarding
    case main
}

@main
struct Bookmark_collectorApp: App {
    @AppStorage("welcome") var showWelcomeScreen: Bool = true
    
    var body: some Scene {
        WindowGroup {
            if showWelcomeScreen {
                firstView()
            }
            else {
                withAnimation {
                    SecondView()
                        .transition(.move(edge: .trailing))
                }
            }
        }
    }
}
