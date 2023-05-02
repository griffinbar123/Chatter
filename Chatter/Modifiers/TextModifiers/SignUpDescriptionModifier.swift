//
//  SignUpDescriptionModifier.swift
//  Chatter
//
//  Created by Griffin Barnard on 5/1/23.
//

import SwiftUI

struct SignUpDescriptionModifier: ViewModifier {
    
    /// modifier for the description of an onboarding screen
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 25)
            .foregroundColor(Color.black)
            .frame(maxWidth: .infinity, alignment: .leading)
        
    }
}


extension View {
    func SignUpDescriptionStyle() -> some View {
        ModifiedContent(content: self, modifier: SignUpDescriptionModifier())
    }
}
