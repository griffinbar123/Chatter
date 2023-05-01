//
//  SignUpDescriptionModifier.swift
//  Chatter
//
//  Created by Griffin Barnard on 5/1/23.
//

import SwiftUI

struct SignUpDescriptionModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.horizontal)
            .foregroundColor(Color.black)
    }
}


extension View {
    func SignUpDescriptionStyle() -> some View {
        ModifiedContent(content: self, modifier: SignUpDescriptionModifier())
    }
}
