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
    var totalScreens: Int = 7
    @State var progress: Double = 0 //progress is onBoardingScreen/TotalScreens
    
    // helper variables for making views
    let progressBarHeight: CGFloat = 10
    let circleSize: CGFloat = 60
        
    var body: some View {
        ZStack {
            if onboardingScreen == 0 && isOnEmail {
                GetEmailScreen()
            } else if onboardingScreen == 0 {
                EntryScreen()
            } else {
                Text("tap to go home")
                    .onTapGesture {
                        onboardingScreen = 0
                    }
                    .position(x:  UIScreen.main.bounds.width - 70, y: 25)
                profileBuilder
            }
        }
        .onChange(of: onboardingScreen) { newValue in
            withAnimation(Animation.spring()) {
                progress = Double(newValue-1) / Double(totalScreens)
            }
        }
    }
    
}

// views for OnboardingScreen
extension OnboardingScreen {
    
    private var profileBuilder: some View {
        ZStack {
            switch onboardingScreen {
            case 1:
                GetNameScreen()
            case 2:
                GetAgeScreen()
            case 3:
                GetGenderScreen()
            case 4:
                GetInterestedGenderScreen()
            case 5:
                GetCategoriesOfInterestScreen()
            case 6:
                GetShortBioScreen()
            case 7:
                SinkOrSwimScreen()
            default:
                EntryScreen()
            }
            
            VStack {
                onboardProgressBar
                Spacer()
            }
        }
    }
    
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
    
}

// functions for OnboardingScreen
extension OnboardingScreen {

}


struct OnboardingScreen_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingScreen()
    }
}
