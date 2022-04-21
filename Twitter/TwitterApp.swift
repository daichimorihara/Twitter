//
//  TwitterApp.swift
//  Twitter
//
//  Created by Daichi Morihara on 2022/04/19.
//

import SwiftUI
import Firebase

@main
struct TwitterApp: App {
    @StateObject var vm = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(vm)
        }
    }
}
