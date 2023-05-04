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
    
    //keeps track of wcich box we are on
    @FocusState private var focusIndex: Int?
    
    //keeps track if the user previously attempted an incorrect value
    @State private var incorrectValuedAttempted: Bool = false
    @State var attempts: Int = 0
    
    var body: some View {
        ZStack{
            VStack {
                Text("Let’s get to know you first.")
                    .SignUpTitleStyle()
                Text("Don’t worry, we are only planning on showing your age in your profile. Oh, and it’s not really cool to fudge this one")
                    .SignUpDescriptionStyle()
                VStack {
                    firstNameBox
                        .modifier(Shake(animatableData: CGFloat(attempts)))
                    lastNameBox
                        .modifier(Shake(animatableData: CGFloat(attempts)))
                }
                .padding(.top, 5)
                
                if incorrectValuedAttempted { // displays after incorrect code attempt was made
                    Text("Invalid name. Please try again")
                        .IncorrectTextStyle()
                    
                }
                
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
                .SignUpInputStyle(userInFocus: focusIndex == 1)
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
                .SignUpInputStyle(userInFocus: focusIndex == 0)
                .focused($focusIndex, equals: 0)
                .onSubmit {
                    if checkForInput() {
                        focusIndex = 1
                    } else {
                        focusIndex = 0
                    }
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
        if checkForInput() {
            onboardingScreen += 1
        } else {
            withAnimation {
                attempts += 1
                incorrectValuedAttempted = true
            }
        }
    }
    
    /// checks if the user has entered data
    private func checkForInput() -> Bool {
        return firstName.count > 0 && containsOnlyLetters(input: firstName) && containsOnlyLetters(input: lastName)
    }
    
    /// checks if characters entered are only strings
    private func containsOnlyLetters(input: String) -> Bool {
        for chr in input {
           if (!(chr >= "a" && chr <= "z") && !(chr >= "A" && chr <= "Z") ) {
              return false
           }
        }
        return true
     }
}

struct GetNameScreen_Previews: PreviewProvider {
    static var previews: some View {
        GetNameScreen()
    }
}
