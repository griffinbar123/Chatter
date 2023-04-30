//
//  EntryScreen.swift
//  Chatter
//
//  Created by Griffin Barnard on 4/29/23.
//

import SwiftUI

struct EntryScreen: View {
    var body: some View {
        ZStack{
            VStack {
                LogoAsMain
                TagLine
                Spacer()
                VStack {
                    loginButton
                        .padding(.bottom, 16)
                    signupButton
                        .padding(.bottom, 32)
                    Text("We store a freakin massive amount of your data. I mean, how else do you expect us to provide you with the most elegant matches?")
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .frame(width: UIScreen.main.bounds.width*0.7)
                        .font(.system(size:12))
                        .padding(.bottom, 40)
                }
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity) .background(BackgroundGradient)

    }
    
    var loginButton: some View {
        Button(action: {
            print(UIScreen.main.bounds.width)
        }, label: {
            Text("Login")
                .padding()
                .frame(width: UIScreen.main.bounds.width*0.8)
                .background(
                    Color.white
                    .cornerRadius(90))
                .font(.system(size:16))
                
        })
    }
    
    var signupButton: some View {
        Button(action: {
            print(UIScreen.main.bounds.width)
        }, label: {
            Text("Sign Up")
                .padding()
                .frame(width: UIScreen.main.bounds.width*0.8)
                .foregroundColor(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 90)
                        .stroke(Color.white, lineWidth: 2)
                )
                .font(.system(size:16))
                
        })
    }
}

struct EntryScreen_Previews: PreviewProvider {
    static var previews: some View {
        EntryScreen()
    }
}
