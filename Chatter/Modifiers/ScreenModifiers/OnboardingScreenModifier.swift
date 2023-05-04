//
//  OnboardingScreenModifier.swift
//  Chatter
//
//  Created by Griffin Barnard on 5/2/23.
//

import SwiftUI

struct OnboardingScreenModifier: ViewModifier {
    ///modifier for onboarding screens (besides the entryScreen)
    func body(content: Content) -> some View {
        content
            .padding(10)
            .padding(.top, 15)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .preferredColorScheme(.light)
            .zIndex(1)
    }
}

extension View {
    func OnboardingScreenStyle() -> some View {
        ModifiedContent(content: self, modifier: OnboardingScreenModifier())
    }
}

