//
//  PokeAPIApp.swift
//  PokeAPI
//
//  Created by dmu mac 24 on 18/09/2024.
//

import SwiftUI

@main
struct PokeAPIApp: App {
    @State private var controller = StateController()
    var body: some Scene {
        WindowGroup {
            ContentView().environment(controller)
        }
    }
}
