//
//  SignUpTitleModifier.swift
//  Chatter
//
//  Created by Griffin Barnard on 5/1/23.
//

import SwiftUI

struct SignUpTitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size:44, weight: .bold))
            .foregroundColor(Color.black)
            .padding(.top, 30)
            .padding(10)
    }
}

extension View {
    func SignUpTitleStyle() -> some View {
        ModifiedContent(content: self, modifier: SignUpTitleModifier())
    }
}

