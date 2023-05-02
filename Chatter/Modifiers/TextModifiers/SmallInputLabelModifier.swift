//
//  SmallInputLabel.swift
//  Chatter
//
//  Created by Griffin Barnard on 5/2/23.
//

import SwiftUI

struct SmallInputLabelModifier: ViewModifier {
    ///modifier for onboarding screens (besides the entryScreen)
    func body(content: Content) -> some View {
        content
            .padding(.leading, 5)
            .font(.system(size: 12))
    }
}

extension View {
    func SmallInputLabelStyle() -> some View {
        ModifiedContent(content: self, modifier: SmallInputLabelModifier())
    }
}



