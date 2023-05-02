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
    
    
    
    var switchTest: some View {
        ZStack {
            switch onboardingScreen {
            case 0:
                EntryScreen()
                    .transition(.asymmetric(
                        insertion: .move(edge: goingForward ? .trailing : .leading),
                        removal: .move(edge: goingForward ? .leading : .trailing)))
            case 1:
                GetPhoneNumberScreen()
                    .transition(.asymmetric(
                        insertion: .move(edge: goingForward ? .trailing : .leading),
                        removal: .move(edge: goingForward ? .leading : .trailing)))
            case 2:
                GetPhoneNumberVerificationScreen()
                    .transition(.asymmetric(
                        insertion: .move(edge: goingForward ? .trailing : .leading),
                        removal: .move(edge: goingForward ? .leading : .trailing)))
            case 3:
                GetNameScreen()
                    .transition(.asymmetric(
                        insertion: .move(edge: goingForward ? .trailing : .leading),
                        removal: .move(edge: goingForward ? .leading : .trailing)))
            case 4:
                GetAgeScreen()
                    .transition(.asymmetric(
                        insertion: .move(edge: goingForward ? .trailing : .leading),
                        removal: .move(edge: goingForward ? .leading : .trailing)))
            case 5:
                GetGenderScreen()
                    .transition(.asymmetric(
                        insertion: .move(edge: goingForward ? .trailing : .leading),
                        removal: .move(edge: goingForward ? .leading : .trailing)))
            case 6:
                GetInterestedGenderScreen()
                    .transition(.asymmetric(
                        insertion: .move(edge: goingForward ? .trailing : .leading),
                        removal: .move(edge: goingForward ? .leading : .trailing)))
            case 7:
                GetTypeOfRelationshipScreen()
                    .transition(.asymmetric(
                        insertion: .move(edge: goingForward ? .trailing : .leading),
                        removal: .move(edge: goingForward ? .leading : .trailing)))
            default:
                EntryScreen()
                    .transition(.asymmetric(
                        insertion: .move(edge: goingForward ? .trailing : .leading),
                        removal: .move(edge: goingForward ? .leading : .trailing)))
            }
            
            if onboardingScreen != 0 {
                VStack {
                    onboardProgressBar
                    Spacer()
                    nextAndBackButtons
                }
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
        HStack {
            ZStack {
                Circle()
                    .frame(width: circleSize, height: circleSize)
                    .scaledToFit()
                    .foregroundColor(Color("PrimaryColor"))
                    .padding()
                    .padding(.horizontal, 10)
                Image(systemName: "lessthan")
                    .resizable()
                    .frame(width: circleSize-41, height: circleSize-25, alignment: .trailing)
                    .foregroundColor(.white)
                    .offset(x:-2)
                    .onTapGesture {
                        handleNextorBack(newOnboardingScreen: -1)
                    }
                
            }
            Spacer()
            ZStack {
                Circle()
                    .frame(width: circleSize, height: circleSize)
                    .scaledToFit()
                    .foregroundColor(Color("PrimaryColor"))
                    .padding()
                    .padding(.horizontal, 10)
                Image(systemName: "greaterthan")
                    .resizable()
                    .frame(width: circleSize-41, height: circleSize-25, alignment: .trailing)
                    .foregroundColor(.white)
                    .offset(x:2)
                    .onTapGesture {
                        handleNextorBack(newOnboardingScreen: 1)
                    }
            }
        }
    }
}
