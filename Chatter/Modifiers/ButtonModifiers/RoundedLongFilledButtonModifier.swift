//
//  RoundedLongFilledButtonModifier.swift
//  Chatter
//
//  Created by Griffin Barnard on 5/1/23.
//

import SwiftUI

struct RoundedLongFilledButtonModifier: ViewModifier {
    let foregroundColor: Color
    let backgroundColor: Color
    let backgroundGradient: LinearGradient?
    
    /// modifier for the  buttons seen like those in the entry screen. have to define a background and foreground color, with an optional gradient background. if gradient given it overrides the given background
    func body(content: Content) -> some View {
        if let bground = backgroundGradient {
            content
                .foregroundColor(foregroundColor)
                .font(.system(size:16))
                .bold()
                .frame(width: UIScreen.main.bounds.width*0.8, height: 55)
                .background(
                    bground
                        .cornerRadius(90)
                    )
        } else {
            content
                .foregroundColor(foregroundColor)
                .font(.system(size:16))
                .bold()
                .frame(width: UIScreen.main.bounds.width*0.8, height: 55)
                .background(
                    backgroundColor
                        .cornerRadius(90))
        }
    }
}

struct CompanyLogoModifier: ViewModifier {
    let foregroundColor: Color?
    let backgroundColor: Color?
    
    /// modifier for a company logo. both foreground and background optional (will inherit both from parent if optional)
    func body(content: Content) -> some View {
        if let fcolor = foregroundColor {
            if let bcolor = backgroundColor {
                content
                    .scaledToFill()
                    .frame(width:15, height:15)
                    .offset(y:-1)
                    .foregroundColor(fcolor)
                    .background(bcolor)
            } else {
                content
                    .scaledToFill()
                    .frame(width:15, height:15)
                    .offset(y:-1)
                    .foregroundColor(fcolor)
            }
        } else{
            if let bcolor = backgroundColor {
                content
                    .scaledToFill()
                    .frame(width:15, height:15)
                    .offset(y:-1)
                    .background(bcolor)
            } else {
                content
                    .scaledToFill()
                    .frame(width:15, height:15)
                    .offset(y:-1)
            }
        }
    }
}


extension View {
    func RoundedLongFilledButtonStyle(foregroundColor: Color, backgroundColor: Color, backgroundGradient: LinearGradient? = nil) -> some View {
        ModifiedContent(content: self, modifier:
                            RoundedLongFilledButtonModifier(
            foregroundColor: foregroundColor,
            backgroundColor: backgroundColor,
            backgroundGradient: backgroundGradient))
    }
    
    func CompanyLogoStyle(foregroundColor: Color? = nil, backgroundColor: Color? = nil) -> some View {
        ModifiedContent(content: self, modifier: CompanyLogoModifier(foregroundColor: foregroundColor, backgroundColor: backgroundColor))
    }
}
