//
//  GlobalVariables.swift
//  Chatter
//
//  Created by Griffin Barnard on 4/29/23.
//

import SwiftUI
let startPoint: UnitPoint = UnitPoint(x:0.5, y:0.0)
let endPoint: UnitPoint = UnitPoint(x:0.5, y:1.0)
let BackgroundGradient : LinearGradient = LinearGradient(colors: [Color("StartBackgroundGradient"), Color("EndBackgroundGradient")], startPoint: startPoint, endPoint: endPoint)

let TagLine = Text("Create Your Pod")
    .foregroundColor(.white)
    .font(.system(size:24))

let LogoAsMain: some View = Image("logo")
    .resizable()
    .scaledToFill()
    .frame(width: 100, height: 70)
    .padding(.top, 50)
    

struct GlobalVariables: View {
    var body: some View {
        ZStack{
            VStack {
                TagLine
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity) .background(BackgroundGradient)
    }
}

struct GlobalVariables_Previews: PreviewProvider {
    static var previews: some View {
        GlobalVariables()
    }
}
