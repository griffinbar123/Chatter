//
//  GetNameScreen.swift
//  Chatter
//
//  Created by Griffin Barnard on 4/30/23.
//

import SwiftUI

struct GetNameScreen: View {
    @AppStorage("onboarding_int") var onboardingScreen = 0
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    
    //keeps track of whcich box we are on
    @FocusState private var focusIndex: Int?
    
    var body: some View {
        ZStack{
            VStack {
                Text("Let’s get to know you first.")
                    .SignUpTitleStyle()
                Text("Don’t worry, we are only planning on showing your age in your profile. Oh, and it’s not really cool to fudge this one")
                    .SignUpDescriptionStyle()
                VStack {
                    VStack(alignment: .leading) {
                        Text("First Name")
                            .InputLabelStyle()
                        TextField("", text: $firstName)
                            .SignUpInputStyle()
                            .focused($focusIndex, equals: 0)
                            .onSubmit {
                                focusIndex = 1
                            }
                            .onTapGesture {
                                focusIndex = 0
                            }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 25)
                    VStack(alignment: .leading) {
                        Text("Last Name (Optional)")
                            .InputLabelStyle()
                        TextField("", text: $lastName)
                            .SignUpInputStyle()
                            .focused($focusIndex, equals: 1)
                            .onSubmit {
                                goForward()
                            }
                            .onTapGesture {
                                focusIndex = 1
                            }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 25)
                }
                .padding(.top, 5)
                Spacer()
                nextButton
            }
        }
        .OnboardingScreenStyle()
        .onAppear {
            // initializes focus index. as a FocusState it needs to be done this way
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                focusIndex = 0
            }
        }
    }
}

// views for GetNameScreen
extension GetNameScreen {
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
}

// functions for GetNameScreen
extension GetNameScreen {
    private func goForward() {
        onboardingScreen += 1
    }
}

struct GetNameScreen_Previews: PreviewProvider {
    static var previews: some View {
        GetNameScreen()
    }
}
