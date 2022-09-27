//
//  Polite_ChatApp.swift
//  Polite Chat
//
//  Created by Roberto Gakiya Cruz on 20/09/22.
//

import SwiftUI
import Firebase

@main
struct Polite_ChatApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
