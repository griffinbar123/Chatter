//
//  EntryScreen.swift
//  Chatter
//
//  Created by Griffin Barnard on 4/29/23.
//

import SwiftUI



struct EntryScreen: View {
    @AppStorage("onboarding_int") var onboardingScreen = 0
    
    // bool to handle if we show the contents of the screen besides logo (for animation)
    @State private var showButton: Bool = false
    
    // bool to handle showing phone screen
    @State private var showPhoneScreen: Bool = false
    
    var body: some View {
        ZStack{
            VStack {
                
                LogoAsMain // logo (from CustomAssets/Miscallenous)
                
                if(showButton){
                    //once shown, does its animation. starts offscreen to make splash screen fade to this screen
                    Text("Make the Sea Smaller")
                        .TagLineStyle()
                        .transition(.opacity)
                    Spacer()
                    logorsign.transition(.opacity)
                }
            }
            
            .fullScreenCover(isPresented: $showPhoneScreen) { // getPhoneNumber view
                NavigationView {
                    GetPhoneNumberScreen()
                }
            }
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity) .background(BackgroundGradient)
            .animation(Animation.easeInOut(duration: 0.7), value: showButton)
            .onAppear{
                onboardingScreen = 0
                withAnimation {
                    showButton = true
                }
        }
    }
    
}

// subviews for EntryScreen
extension EntryScreen {
    
    /// subiew that groups the buttons vertically as well as adds a disclaimer
    private var logorsign: some View {
        VStack {
            appleSignIn
                .padding(.bottom, 6)
            facebookSignIn
                .padding(.bottom, 6)
            phoneSignIn
                .padding(.bottom, 18)
            Text("We store a freakin massive amount of your data. I mean, how else do you expect us to provide you with the most elegant matches?")
            .DisclaimerTextStyle(foregroundColor: .white)        }
    }
    
    /// button for signing in with apple option
    private var appleSignIn: some View {
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
    
    /// button for signing in with facebook option
    private var facebookSignIn: some View {
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
    
    /// button for signing in with phone number option
    private var phoneSignIn: some View {
        Button(action: {
            goToPhoneNumber()
        }, label: {
            Text("Continue with Phone Number")
                .RoundedLongFilledButtonStyle(foregroundColor: .black, backgroundColor: .white)
        })
    }
}

// functions for EntryScreen
extension EntryScreen {
    
    /// shows GetPhoneNumberScreen
    private func goToPhoneNumber(){
        showPhoneScreen.toggle()
    }
}



//------ preview
struct EntryScreen_Previews: PreviewProvider {
    static var previews: some View {
        EntryScreen()
    }
}
