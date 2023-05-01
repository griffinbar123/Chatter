//
//  RoundedLongFilledButtonModifier.swift
//  Chatter
//
//  Created by Griffin Barnard on 5/1/23.
//

import SwiftUI

struct RoundedLongFilledButtonModifier: ViewModifier {
    // background needed, but gradient can override it. best way of mkaing sure a background is present 
    let foregroundColor: Color
    let backgroundColor: Color
    let backgroundGradient: LinearGradient?
    
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
