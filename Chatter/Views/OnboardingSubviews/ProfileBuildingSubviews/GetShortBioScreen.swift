//
//  ShortBioScreen.swift
//  Chatter
//
//  Created by Griffin Barnard on 5/2/23.
//

import SwiftUI

struct GetShortBioScreen: View {
    @AppStorage("onboarding_int") var onboardingScreen = 0
    
    var body: some View {
        ZStack {
            backButton
            VStack {
                Text("short bio screen")
                Spacer()
                nextButton
            }
        }
        .OnboardingScreenStyle()
        
    }
}

// views for GetShortBioScreen
extension GetShortBioScreen {
    private var nextButton: some View {
        Button {
            goForward()
        } label: {
            HStack{
                Text("Next")
                    .RoundedLongFilledButtonStyle(
                        foregroundColor: .black,
                        backgroundColor: Color.gray,
                        backgroundGradient: BackgroundGradient,
                        boolClosure: nil,
                        fontSize: 18
                    )
            }
            .frame(maxWidth: .infinity)
        }
    }
    
    /// button to go back to previous page
    private var backButton: some View {
        Button {
            goBack()
        } label: {
            Image(systemName: "lessthan")
                .resizable()
                .foregroundColor(.gray)
                .frame(width: 17, height: 33)
                .padding(.top, 30)
        }
        .position(x:24)
    }
}

// functions for GetShortBioScreen
extension GetShortBioScreen {
    private func goForward() {
        onboardingScreen += 1
    }
    private func goBack() {
        onboardingScreen -= 1
    }
}

struct GetShortBioScreen_Previews: PreviewProvider {
    static var previews: some View {
        GetShortBioScreen()
    }
}
