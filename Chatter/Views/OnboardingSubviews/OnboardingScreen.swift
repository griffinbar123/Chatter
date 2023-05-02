//
//  OnboardingScreen.swift
//  Chatter
//
//  Created by Griffin Barnard on 4/30/23.
//

import SwiftUI


struct OnboardingScreen: View {
    // app storage for state in onboarding process we are in
    
    /// very important. this indicates the state of onboard process. 0 means we are in the regisration section of the onboarding process (signing in/creating account). 1+ indicates which screen in the profile building process we are in (gathering name, gender, and so forth). once user is signed in (reached past all of the onboarding screens) this number becomes irrelevant and is never seen because user is signed in (which is checked in the parent screen of this, if user is signed in we never go here)
    @AppStorage("onboarding_int") var onboardingScreen = 0
    
    /// signedin indicates signed in status of user. we use it here to set it to true when user reaches past onboarding status
    @AppStorage("signed_in") var userSignedIn = false
    
    /// indicates if the user is on the email part of the registration section of onboarding process)
    @AppStorage("is_on_email") var isOnEmail = false
    
    // total number of profile building screens. used in animation of progress bar.
    var totalScreens: Int = 8
    @State var progress: Double = 0 //progress is onBoardingScreen/TotalScreens
    
    // helper variables for making views
    let progressBarHeight: CGFloat = 10
    let circleSize: CGFloat = 60
    
    // boool that indicates which way the bar should be animating
    @State var goingForward = true
        
    var body: some View {
        ZStack {
            if onboardingScreen == 0 && isOnEmail {
                GetEmailScreen()
            } else if onboardingScreen == 0 {
                EntryScreen()
            } else {
                Text("here")
                    .onTapGesture {
                        onboardingScreen = 0
                    }
            }
        }
    }
    
    
    
    
    // everything below here is to be temporarily ignored
    
    
    
    func handleNextorBack(newOnboardingScreen: Int) {
        if(newOnboardingScreen < 0) {
            goingForward = false
        } else {
            goingForward = true
        }
        withAnimation(.spring()) {
            onboardingScreen += newOnboardingScreen
            self.progress = Double(onboardingScreen) / Double(totalScreens)
        }
    }
    
    
    
    var profileBuilder: some View {
        ZStack {
            switch onboardingScreen {
            default:
                ZStack{
                    
                }
            }
            

            VStack {
                onboardProgressBar
                Spacer()
                nextAndBackButtons
            
            }
        }
    }

    
}

struct OnboardingScreen_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingScreen()
    }
}

extension OnboardingScreen {
    private var onboardProgressBar: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .frame(width: UIScreen.main.bounds.width, height: progressBarHeight)
                .foregroundColor(Color("LightGray"))
            Rectangle()
                .frame(width: UIScreen.main.bounds.width * progress, height: progressBarHeight)
                .foregroundColor(Color("PrimaryColor"))
        }
    }
    
    private var nextAndBackButtons: some View {
        ZStack {
            
        }
    }
    
    ///view to handle the next button at the bottom of the screen which sends the user to the next profile building stage
    private var nextButton: some View {
        HStack{
//            Button {
//                moveForward()
//            } label: {
//                Text("Next")
//                    .RoundedLongFilledButtonStyle(
//                        foregroundColor: .black.opacity(checkIfValidEmail() ? 1 : 0.3),
//                        backgroundColor: Color.gray,
//                        backgroundGradient:
//                            checkIfValidEmail() ? BackgroundGradient : nil
//                    )
//
//                    .shadow(color: Color("PrimaryColor"),
//                            radius: checkIfValidEmail() ? 1 : 0)
//                    .padding()
//                    .opacity(checkIfValidEmail() ? 1 : 0.4)
//            }
//            .disabled(!checkIfValidEmail())
        }
        .frame(maxWidth: .infinity)
    }
}

extension OnboardingScreen {
    private func moveForward() {
        
    }
}
