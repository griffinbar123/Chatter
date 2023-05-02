//
//  ChatterApp.swift
//  Chatter
//
//  Created by Griffin Barnard on 4/29/23.
//

import SwiftUI

@main
struct ChatterApp: App {
    @AppStorage("signed_in") var userSignedIn = false;
    
    var body: some Scene {
        WindowGroup {
            if userSignedIn {
                FindMatchScreen()
            } else {
                EntryScreen()
//                    GetPhoneNumberScreen()
            }
        }
    }
}
