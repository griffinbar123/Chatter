//
//  ChatterApp.swift
//  Chatter
//
//  Created by Griffin Barnard on 4/29/23.
//

import SwiftUI

@main
struct ChatterApp: App {
    /// checks if user is signed in
    @AppStorage("signed_in") var userSignedIn = false;
    
    var body: some Scene {
        WindowGroup { // if user is signed in we send them to the main app (findMatch is a placerholder for that)
            if userSignedIn {
                FindMatchScreen()
            } else { // if user isn't signed in we take them to the onboarding process and go from there
                OnboardingScreen()
            }
        }
    }
}
