//
//  OnboardingScreen.swift
//  Chatter
//
//  Created by Griffin Barnard on 4/30/23.
//

import SwiftUI


struct OnboardingScreen: View {
    //app storage
    @AppStorage("signed_in") var userSignedIn = false
    @AppStorage("onboarding_int") var onboardingScreen = 0
    
    var TotalScreens: Int = 8
    @State var progress: Double = 0
    
    let progressBarHeight: CGFloat = 10
    let circleSize: CGFloat = 60
    
    let transition: AnyTransition = .asymmetric(
        insertion: .move(edge: .trailing),
        removal: .move(edge: .leading))
    
        
    var body: some View {
        ZStack {
            switch onboardingScreen {
            case 0:
                EntryScreen()
                    .transition(transition)
            case 1:
                GetPhoneNumberScreen()
                    .transition(transition)
            case 2:
                PhoneNumberVerificationScreen()
                    .transition(transition)
            case 3:
                GetNameScreen()
                    .transition(transition)
            case 4:
                GetAgeScreen()
                    .transition(transition)
            case 5:
                GetGenderScreen()
                    .transition(transition)
            case 6:
                GetInterestedGenderScreen()
                    .transition(transition)
            case 7:
                GetTypeOfRelationshipScreen()
                    .transition(transition)
            default:
                EntryScreen()
                    .transition(transition)
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
    
    func handleNextorBack(newOnboardingScreen: Int) {
        withAnimation(.spring()) {
            onboardingScreen += newOnboardingScreen
            self.progress = Double(onboardingScreen) / Double(TotalScreens)
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
