//
//  OnboardingScreenModifier.swift
//  Chatter
//
//  Created by Griffin Barnard on 5/2/23.
//

import SwiftUI

struct OnboardingScreenModifier: ViewModifier {
    
    let disableTrailingPadding: Bool?
    
    ///modifier for onboarding screens (besides the entryScreen)
    func body(content: Content) -> some View {
        if let _ = disableTrailingPadding {
            content
                .padding(.leading, 10)
                .padding(.bottom, 10)
                .padding(.top, 15)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .preferredColorScheme(.light)
        } else {
            content
                .padding(.horizontal, 10)
                .padding(.bottom, 10)
                .padding(.top, 15)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .preferredColorScheme(.light)        }
    }
}

extension View {
    func OnboardingScreenStyle(disableTrailingPadding: Bool? = nil) -> some View {
        ModifiedContent(content: self, modifier: OnboardingScreenModifier(disableTrailingPadding: disableTrailingPadding))
    }
}

