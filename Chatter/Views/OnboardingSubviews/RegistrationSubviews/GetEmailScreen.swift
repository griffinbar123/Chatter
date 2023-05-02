//
//  GetEmailScreen.swift
//  Chatter
//
//  Created by Griffin Barnard on 5/2/23.
//

import SwiftUI

struct GetEmailScreen: View {
    @AppStorage("is_on_email") var isOnEmail = false
    
    var body: some View {
        ZStack{
            VStack {
                //go back button
                Button {
                    isOnEmail = false
                } label: {
                    Text("temp button to go back")
                }
                
                Text("email screen")
            }
        }
    }
}

struct GetEmailScreen_Previews: PreviewProvider {
    static var previews: some View {
        GetEmailScreen()
    }
}
