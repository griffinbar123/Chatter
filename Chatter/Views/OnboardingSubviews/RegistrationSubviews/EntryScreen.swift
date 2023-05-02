//
//  EntryScreen.swift
//  Chatter
//
//  Created by Griffin Barnard on 4/29/23.
//

import SwiftUI



struct EntryScreen: View {
    @AppStorage("onboarding_int") var onboardingScreen = 0
    @State var showButton: Bool = false
    
    @State var showPhoneScreen = false
    
    var body: some View {
        ZStack{
            VStack {
                LogoAsMain
                if(showButton){
                    
                    Text("Create Your Pod")
                        .TagLineStyle()
                        .transition(.opacity)
                    Spacer()
                    logorsign.transition(.opacity)
                }
            }
            .fullScreenCover(isPresented: $showPhoneScreen) {
                NavigationView {
                    GetPhoneNumberScreen()
                }
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity) .background(BackgroundGradient)
            .animation(Animation.easeInOut(duration: 0.6), value: showButton)
            .onAppear{
                withAnimation {
                    showButton = true
                }
        }
    }
    
    private func goToPhoneNumber(){
        showPhoneScreen.toggle()
    }
}

struct EntryScreen_Previews: PreviewProvider {
    static var previews: some View {
        EntryScreen()
    }
}




// views
extension EntryScreen {
    var logorsign: some View {
        VStack {
            appleSignIn
                .padding(.bottom, 8)
            facebookSignIn
                .padding(.bottom, 8)
            phoneSignIn
                .padding(.bottom, 16)
            Text("We store a freakin massive amount of your data. I mean, how else do you expect us to provide you with the most elegant matches?")
            .DisclaimerTextStyle(foregroundColor: .white)        }
    }
    
    var appleSignIn: some View {
        Button(action: {
            print(UIScreen.main.bounds.width)
        }, label: {
            HStack{
                Image(systemName: "apple.logo")
                    .resizable()
                    .CompanyLogoStyle()
                Text("Continue with Apple")
                    
            }
            .RoundedLongFilledButtonStyle(foregroundColor: .white, backgroundColor: .black)
        })
    }
    
    var facebookSignIn: some View {
        Button(action: {
            print(UIScreen.main.bounds.width)
        }, label: {
            HStack{
                Image("f_logo")
                    .resizable()
                    .CompanyLogoStyle()
                Text("Continue with Facebook")
                    
            }
            .RoundedLongFilledButtonStyle(foregroundColor: .white, backgroundColor: Color("FacebookBlue"))
        })
        
    }
    
    var phoneSignIn: some View {
        Button(action: {
            goToPhoneNumber()
        }, label: {
            Text("Continue with Phone Number")
                .RoundedLongFilledButtonStyle(foregroundColor: .black, backgroundColor: .white)
        })
    }
}
