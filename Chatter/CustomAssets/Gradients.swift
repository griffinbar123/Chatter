//
//  GlobalVariables.swift
//  Chatter
//
//  Created by Griffin Barnard on 4/29/23.
//

import SwiftUI
let startPoint: UnitPoint = UnitPoint(x:0.5, y:0.3)
let endPoint: UnitPoint = UnitPoint(x:0.5, y:1.0)

let BackgroundGradient : LinearGradient = LinearGradient(colors: [Color("StartBackgroundGradient"), Color("EndBackgroundGradient")], startPoint: startPoint, endPoint: endPoint)
    

struct Gradients: View {
    var body: some View {
        ZStack{
            VStack {
                Button {
                    
                } label: {
                    Text("Text")
                        .RoundedLongFilledButtonStyle(
                            foregroundColor: .white,
                            backgroundColor: .white,
                            backgroundGradient: BackgroundGradient
                        )
                }

            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.white)
    }
}

struct Gradients_Previews: PreviewProvider {
    static var previews: some View {
        Gradients()
    }
}
