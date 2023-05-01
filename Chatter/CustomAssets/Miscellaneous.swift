//
//  Miscellaneous.swift
//  Chatter
//
//  Created by Griffin Barnard on 5/1/23.
//

import SwiftUI


let LogoAsMain: some View = Image("logo")
    .resizable()
    .scaledToFill()
    .frame(width: 100, height: 70)
    .padding(.top, 50)

struct Miscellaneous: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct Miscellaneous_Previews: PreviewProvider {
    static var previews: some View {
        Miscellaneous()
    }
}
