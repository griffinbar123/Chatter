//
//  SinkOrSwimScreen.swift
//  Chatter
//
//  Created by Griffin Barnard on 5/2/23.
//

import SwiftUI

struct SinkOrSwimScreen: View {
    @AppStorage("onboarding_int") var onboardingScreen = 0
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            backButton
            VStack {
                Text("sink or swim")
                Spacer()
                nextButton
            }
        }
        .OnboardingScreenStyle()
        .onAppear {
            onboardingScreen = 8
        }
    }
}

// views for sinkorswim
extension SinkOrSwimScreen {
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

// functions for sinkorswim
extension SinkOrSwimScreen {
    private func goForward() {
        onboardingScreen += 1
    }
    private func goBack() {
        onboardingScreen -= 1
    }
}

struct SinkOrSwimScreen_Previews: PreviewProvider {
    static var previews: some View {
        SinkOrSwimScreen()
    }
}
