//
//  InputLabelModifier.swift
//  Chatter
//
//  Created by Griffin Barnard on 5/2/23.
//

import SwiftUI

struct InputLabelModifier: ViewModifier {
    ///modifier for onboarding screens (besides the entryScreen)
    func body(content: Content) -> some View {
        content
            .bold()
            .font(.system(size:16))
    }
}

extension View {
    func InputLabelStyle() -> some View {
        ModifiedContent(content: self, modifier: InputLabelModifier())
    }
}
