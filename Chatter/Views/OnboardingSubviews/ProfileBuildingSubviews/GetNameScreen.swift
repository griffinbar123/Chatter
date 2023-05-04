//
//  GetNameScreen.swift
//  Chatter
//
//  Created by Griffin Barnard on 4/30/23.
//

import SwiftUI

struct GetNameScreen: View {
    @AppStorage("onboarding_int") var onboardingScreen = 0
    
    
    // stores the last ane first name of the user
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
                    firstNameBox
                    lastNameBox
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
    
    /// gets the lastname of the user
    private var lastNameBox: some View {
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
    
    /// gets the firstname of the user
    private var firstNameBox: some View {
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
    }
    
    private var nextButton: some View {
        /// buttons that handles going forward on the screens
        Button {
            goForward()
        } label: {
            HStack{
                Text("Next")
                    .RoundedLongFilledButtonStyle(
                        foregroundColor: .black,
                        backgroundColor: Color.gray,
                        backgroundGradient: BackgroundGradient,
                        boolClosure: checkForInput,
                        fontSize: 18
                    )

                    
            }
            .frame(maxWidth: .infinity)
            .disabled(!checkForInput())
        }
    }
}

// functions for GetNameScreen
extension GetNameScreen {
    private func goForward() {
        onboardingScreen += 1
    }
    
    /// checks if the user has entered data
    private func checkForInput() -> Bool {
        return firstName.count > 0 && lastName.count > 0
    }
}

struct GetNameScreen_Previews: PreviewProvider {
    static var previews: some View {
        GetNameScreen()
    }
}
