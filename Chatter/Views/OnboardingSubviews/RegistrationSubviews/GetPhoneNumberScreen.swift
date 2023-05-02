 //
//  GetPhoneNumberScreen.swift
//  Chatter
//
//  Created by Griffin Barnard on 4/30/23.
//

import SwiftUI

struct GetPhoneNumberScreen: View {
    @Environment(\.dismiss) var dismiss
    
    // phone number entered by user
    @State private var phoneNumber: String = ""
    
    //controls when keyboard is active for a user (always on this screen)
    @FocusState private var userInFocus: Bool
    
    // country code selected by user. right now static
    @State private var countryCode: String = "US"
    @State private var countryPhoneCode: String = "1"
    
    // phone length expected from a given country. right now static
    @State private var expectedPhoneLength: Int = 10
    
    var body: some View {
        ZStack{
            
            dismissButton
                .position(x: UIScreen.main.bounds.width-38)

            VStack(alignment: .leading){
                // title and description
                Text("Hey, can we get your number?")
                    .SignUpTitleStyle()
                Text("Thought you were kinda cute ;)")
                    .SignUpDescriptionStyle()
                
                phoneInfo // phone inputs
                    .padding(.horizontal, 25)
                    .padding(.top, 25)
                    .foregroundColor(.black)
                
                Spacer()
                
                NavigationLink { //skip button TODO: remove this
                    GetPhoneNumberVerificationScreen()
                } label: {
                    Text("SKIPPP BUTTONNNNNNNNNNNNNNNN")
                        .foregroundColor(.black)
                }
                
                verificationNavLink // navlink to the phone number verfication screen
            }
                }
        .OnboardingScreenStyle()
        .onAppear{
            userInFocus = true
        }
        
    }
}

// extension of views
extension GetPhoneNumberScreen {
    
    /// navlink to the phone number verfication screen
    private var verificationNavLink: some View {
        NavigationLink {
            GetPhoneNumberVerificationScreen()
        } label: {
            getVerificationButton // the button itself
        }
        .disabled(phoneNumber.count != expectedPhoneLength)
    }
    
    ///view to handle the two pieces of phone information
    private var phoneInfo: some View {
        HStack(spacing: 10){
            HStack {
                Text(countryCode + "  +" + countryPhoneCode)
                    .font(.system(size:20))
                    .minimumScaleFactor(0.01)
            }
            .frame(width: 70, height: 55)
            .padding(.horizontal, 5)
            .background(Color("textBackground"))
            .cornerRadius(10)
            
            TextField("", text: $phoneNumber)
                .focused($userInFocus)
                .keyboardType(.numberPad)
                .frame(height: 55)
                .frame(maxWidth: 200)
                .padding(.leading)
                .background(Color("textBackground"))
                .cornerRadius(10)
                .font(.system(size:22))
                .minimumScaleFactor(0.01)
            Spacer()
                
        }
    }
    
    ///view to handle the verification button which sends the user to the next page at the bottom of the scren
    private var getVerificationButton: some View {
        HStack{
            Text("Get Verification")
                .RoundedLongFilledButtonStyle(
                    foregroundColor: .black.opacity(checkIfValidPhoneNumber() ? 1 : 0.3),
                    backgroundColor: Color.gray,
                    backgroundGradient:
                        checkIfValidPhoneNumber() ? BackgroundGradient : nil
                )
                
                .shadow(color: Color("PrimaryColor"),
                    radius: checkIfValidPhoneNumber() ? 2 : 0)
                .padding()
                .opacity(checkIfValidPhoneNumber() ? 1 : 0.4)
                
        }
        .frame(maxWidth: .infinity)
    }
    
    /// button to send user back to the original entry screen
    private var dismissButton: some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: "xmark")
                .resizable()
                .foregroundColor(.gray)
                .scaledToFit()
                .frame(width: 25, height: 25)
                .padding(.top, 30)
        }
    }
}

// extension of functions
extension GetPhoneNumberScreen {
    private func checkIfValidPhoneNumber() -> Bool {
        return phoneNumber.count == expectedPhoneLength
    }
}

//------ preview
struct GetPhoneNumberScreen_Previews: PreviewProvider {
    static var previews: some View {
        GetPhoneNumberScreen()
    }
}
