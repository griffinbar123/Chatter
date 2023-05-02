//
//  GetEmailScreen.swift
//  Chatter
//
//  Created by Griffin Barnard on 5/2/23.
//

import SwiftUI

struct GetEmailScreen: View {
    @AppStorage("is_on_email") var isOnEmail: Bool = false
    @AppStorage("onboarding_int") var onboardingScreen = 0
    
    @State private var email: String = ""
    @State private var incorrectEmailAttempted: Bool = false
    
    @FocusState private var focused: Bool
    
    var body: some View {
        ZStack{
            //go back button TODO: delete this later
            Button {
                isOnEmail = false
            } label: {
                Text("temp button to go back")
            }
            .position(x:100)
            
            VStack {
                
                Text("PLEASE GIVE ME YOUR EMAIL!!!!!")
                    .SignUpTitleStyle()
                
                Text("Or else i'll be V sad :((((. pwease 👀 👉👈")
                    .SignUpDescriptionStyle()
                
                emailInput
            
                if incorrectEmailAttempted { // displays after invalid email submission attempt was made
                    Text("Incorrect code. Please try again")
                        .foregroundColor(.red)
                        .padding(.vertical, 15)
                        .padding(.horizontal, 30)
                }
                
                Spacer()
                nextButton
            }
        }
        .OnboardingScreenStyle()
        .onAppear {
            focused = true
        }
    }
}

// structs for getEmailScreen
extension GetEmailScreen {
    
    private var emailInput: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text("Email")
                .SmallInputLabelStyle()
            TextField("", text: $email)
                .focused($focused)
                .autocapitalization(.none)
                .SignUpInputStyle()
                .onSubmit {
                    if checkIfValidEmail() {
                        goToNextPage()
                    }
                }
        }
        .padding(.vertical)
    }
    
    ///view to handle the next button at the bottom of the screen which sends the user to the profile building part of the onboarding process
    private var nextButton: some View {
        HStack{
            Button {
                goToNextPage()
            } label: {
                Text("Next")
                    .RoundedLongFilledButtonStyle(
                        foregroundColor: .black.opacity(checkIfValidEmail() ? 1 : 0.3),
                        backgroundColor: Color.gray,
                        backgroundGradient:
                            checkIfValidEmail() ? BackgroundGradient : nil
                    )
                
                    .shadow(color: Color("PrimaryColor"),
                            radius: checkIfValidEmail() ? 1 : 0)
                    .padding()
                    .opacity(checkIfValidEmail() ? 1 : 0.4)
            }
            .disabled(!checkIfValidEmail())
        }
        .frame(maxWidth: .infinity)
    }
}

// functions for getEmailScreen
extension GetEmailScreen {
    // send user to next page
    private func goToNextPage() {
        isOnEmail = false
        onboardingScreen = 1
        
    }
    
    
    // checks if input is a valid email address
    private func checkIfValidEmail() -> Bool {
        if email.count > 100 {
                return false
            }
            let emailFormat = "(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}" + "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" + "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-" + "z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5" + "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" + "9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" + "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
            //let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
            return emailPredicate.evaluate(with: email)
    }
}

struct GetEmailScreen_Previews: PreviewProvider {
    static var previews: some View {
        GetEmailScreen()
    }
}


