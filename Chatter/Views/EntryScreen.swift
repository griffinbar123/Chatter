//
//  EntryScreen.swift
//  Chatter
//
//  Created by Griffin Barnard on 4/29/23.
//

import SwiftUI

struct EntryScreen: View {
    @State var showButton: Bool = false;
    var body: some View {
        ZStack{
            VStack {
                LogoAsMain
                
                if(showButton){
                    TagLine
                    Spacer()
                    logorsign
                }
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity) .background(BackgroundGradient)
            .animation(Animation.easeOut(duration: 0.7), value: showButton)
            .onAppear{
                withAnimation {
                    showButton = true
                }
        }
    }
    
    var logorsign: some View {
        VStack {
            skipSignIn
                .padding(.bottom, 8)
            appleSignIn
                .padding(.bottom, 8)
            facebookSignIn
                .padding(.bottom, 8)
            phoneSignIn
                .padding(.bottom, 16)
            Text("We store a freakin massive amount of your data. I mean, how else do you expect us to provide you with the most elegant matches?")
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .frame(width: UIScreen.main.bounds.width*0.7)
                .font(.system(size:12))
                .padding(.bottom, 40)
        }
    }
    
    var skipSignIn: some View {
        Button(action: {
            print(UIScreen.main.bounds.width)
        }, label: {
            HStack{
                Text("skip to next page")
                    
            }.padding()
                .frame(width: UIScreen.main.bounds.width*0.8)
                .background(
                    Color.black
                        .cornerRadius(90))
                .foregroundColor(.white)
                .font(.system(size:16))
                .bold()
        })
    }
    
    var appleSignIn: some View {
        Button(action: {
            print(UIScreen.main.bounds.width)
        }, label: {
            HStack{
                Image(systemName: "apple.logo")
                    .resizable()
                    .scaledToFill()
                    .frame(width:15, height:15)
                    .offset(y:-1)
                Text("Continue with Apple")
                    
            }.padding()
                .frame(width: UIScreen.main.bounds.width*0.8)
                .background(
                    Color.black
                        .cornerRadius(90))
                .foregroundColor(.white)
                .font(.system(size:16))
                .bold()
        })
    }
    
    var facebookSignIn: some View {
        Button(action: {
            print(UIScreen.main.bounds.width)
        }, label: {
            HStack{
                Image(systemName: "apple.logo")
                    .resizable()
                    .scaledToFill()
                    .frame(width:15, height:15)
                    .offset(y:-1)
                Text("Continue with Facebook")
                    
            }.padding()
                .frame(width: UIScreen.main.bounds.width*0.8)
                .background(
                    Color("FacebookBlue")
                        .cornerRadius(90))
                .foregroundColor(.white)
                .font(.system(size:16))
                .bold()
                
        })
    }
    
    var phoneSignIn: some View {
        Button(action: {
            print(UIScreen.main.bounds.width)
        }, label: {
            Text("Continue with Phone Number")
                .padding()
                .frame(width: UIScreen.main.bounds.width*0.8)
                .background(
                    Color.white
                    .cornerRadius(90))
                .font(.system(size:16))
                .bold()
                
        })
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
    
//    var signupButton: some View {
//        Button(action: {
//            print(UIScreen.main.bounds.width)
//        }, label: {
//            Text("Sign Up")
//                .padding()
//                .frame(width: UIScreen.main.bounds.width*0.8)
//                .foregroundColor(.white)
//                .overlay(
//                    RoundedRectangle(cornerRadius: 90)
//                        .stroke(Color.white, lineWidth: 2)
//                )
//                .font(.system(size:16))
//
//        })
//    }
}

struct EntryScreen_Previews: PreviewProvider {
    static var previews: some View {
        EntryScreen()
    }
}
