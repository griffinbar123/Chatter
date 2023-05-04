//
//  SignUpInputModifier.swift
//  Chatter
//
//  Created by Griffin Barnard on 5/2/23.
//

import SwiftUI

struct SignUpInputModifier: ViewModifier {
    
    let userInFocus: Bool
    
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
            .shadow(color: .gray, radius: userInFocus ? 4 : 0, x: 0, y: userInFocus ? 4 : 0)
    }
}

extension View {
    func SignUpInputStyle(userInFocus: Bool) -> some View {
        ModifiedContent(content: self, modifier: SignUpInputModifier(userInFocus: userInFocus))
    }
}
