//
//  SignUpTitleModifier.swift
//  Chatter
//
//  Created by Griffin Barnard on 5/1/23.
//

import SwiftUI

struct SignUpTitleModifier: ViewModifier {
    
    /// modifier for the title of an onboarding screen
    func body(content: Content) -> some View {
        content
            .font(.system(size:44, weight: .bold))
            .foregroundColor(Color.black)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 30)
            .padding(.vertical, 10)
            .padding(.leading)
    }
}

extension View {
    func SignUpTitleStyle() -> some View {
        ModifiedContent(content: self, modifier: SignUpTitleModifier())
    }
}

