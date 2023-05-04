//
//  BorderModifier.swift
//  Chatter
//
//  Created by Griffin Barnard on 5/4/23.
//

import SwiftUI


struct BorderModifier: ViewModifier {
    
    let isSelected: Bool
    let color1: Color
    let color2: Color
    let lineWidth: CGFloat
    
    ///modifier for onboarding screens (besides the entryScreen)
    func body(content: Content) -> some View {
        content
            .contentShape(Rectangle())
            .overlay(
                    RoundedRectangle(cornerRadius: 90)
                        .stroke(isSelected ? color1 : color2, lineWidth: lineWidth)
                )
    }
}

extension View {
    func BorderStyle(isSelected: Bool, color1: Color, color2: Color, lineWidth: CGFloat) -> some View {
        ModifiedContent(content: self, modifier: BorderModifier(isSelected: isSelected, color1: color1, color2: color2, lineWidth: lineWidth))
    }
}

