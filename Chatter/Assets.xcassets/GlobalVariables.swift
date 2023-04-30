//
//  BackgroundColors.swift
//  Chatter
//
//  Created by Griffin Barnard on 4/29/23.
//

import SwiftUI

var startPoint = UnitPoint(x:0.5, y:0.3)
var endPoint = UnitPoint(x:0.5, y:1.0)

var BackgroundGradient: some View = LinearGradient(colors: [Color("StartBackgroundGradient"), Color("EndBackgroundGradient")], startPoint: startPoint, endPoint: endPoint)
    .ignoresSafeArea()

struct BackgroundColors: View {
    var body: some View {
        BackgroundGradient
    }
}

struct BackgroundColors_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundColors()
    }
}
