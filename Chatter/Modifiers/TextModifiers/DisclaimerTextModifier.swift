//
//  DisclaimerTextModifier.swift
//  Chatter
//
//  Created by Griffin Barnard on 5/1/23.
//

import SwiftUI

struct DisclaimerTextModifier: ViewModifier {
    let foregroundColor: Color?
    
    /// modifier for disclaimer text
    func body(content: Content) -> some View {
        if let fcolor  = foregroundColor {
            content
                .foregroundColor(fcolor)
                .multilineTextAlignment(.center)
                .frame(width: UIScreen.main.bounds.width*0.7)
                .font(.system(size:12))
                .padding(.bottom, 40)
        } else {
            content
                .multilineTextAlignment(.center)
                .frame(width: UIScreen.main.bounds.width*0.7)
                .font(.system(size:12))
                .padding(.bottom, 40)
        }
    }
}

extension View {
    func DisclaimerTextStyle(foregroundColor: Color? = nil) -> some View {
        ModifiedContent(content: self, modifier: DisclaimerTextModifier(foregroundColor: foregroundColor))
    }
}
