//
//  SignUpInputModifier.swift
//  Chatter
//
//  Created by Griffin Barnard on 5/2/23.
//

import SwiftUI

struct SignUpInputModifier: ViewModifier {
    ///modifier for onboarding screens (besides the entryScreen)
    func body(content: Content) -> some View {
        content
            .frame(height:55)
            .padding(.horizontal, 5)
            .background(Color("textBackground"))
            .cornerRadius(10)
            .font(.system(size:22))
            .minimumScaleFactor(0.01)
            .lineLimit(1)
    }
}

extension View {
    func SignUpInputStyle() -> some View {
        ModifiedContent(content: self, modifier: SignUpInputModifier())
    }
}
