//
//  TagLineModifier.swift
//  Chatter
//
//  Created by Griffin Barnard on 5/1/23.
//

import SwiftUI

struct IncorrectTextModifier: ViewModifier {
    
    /// modifier for the tagline (Create Your Pod)
    func body(content: Content) -> some View {
        content
            .foregroundColor(.red)
            .padding(.vertical, 15)
            .padding(.horizontal, 30)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

extension View {
    func IncorrectTextStyle() -> some View {
        ModifiedContent(content: self, modifier: IncorrectTextModifier())
    }
}
