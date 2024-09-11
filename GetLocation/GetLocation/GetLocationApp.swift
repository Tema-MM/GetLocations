//
//  GetLocationApp.swift
//  GetLocation
//
//  Created by Makape Tema on 2024/06/21.
//

import SwiftUI
import Firebase

@main
struct GetLocationApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
