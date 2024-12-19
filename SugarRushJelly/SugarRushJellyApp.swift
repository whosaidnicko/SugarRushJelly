//
//  SugarRushJellyApp.swift
//  SugarRushJelly
//
//  Created by Nicolae Chivriga on 12/12/2024.
//

import SwiftUI

@main
struct SugarRushJellyApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                LoadingView()
            }
        }
    }
}

extension Font {
    static var alfaSlab: String = "AlfaSlabOne-Regular"
}