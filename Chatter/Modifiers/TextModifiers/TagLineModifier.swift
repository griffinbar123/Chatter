//
//  TagLineModifier.swift
//  Chatter
//
//  Created by Griffin Barnard on 5/1/23.
//

import SwiftUI

struct TagLineModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(.system(size:24))
    }
}

extension View {
    func TagLineStyle() -> some View {
        ModifiedContent(content: self, modifier: TagLineModifier())
    }
}
