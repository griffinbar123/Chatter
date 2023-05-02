 //
//  GetPhoneNumberScreen.swift
//  Chatter
//
//  Created by Griffin Barnard on 4/30/23.
//

import SwiftUI

struct GetPhoneNumberScreen: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var phoneNumber = ""
    @FocusState private var userInFocus: Bool
    
    @State private var countryCode: String = "US"
    @State private var countryPhoneCode: String = "1"
    
    @State private var expectedPhoneLength: Int = 10
    
    var body: some View {
        ZStack{
            Color.white.ignoresSafeArea()
            
            dismissButton
                .position(x: UIScreen.main.bounds.width-38)

            VStack(alignment: .leading){
                Text("Hey, can we get your number?")                    .SignUpTitleStyle()
                Text("Thought you were kinda cute ;)")
                    .SignUpDescriptionStyle()
                phoneInfo
                    .padding(.horizontal, 25)
                    .padding(.top, 25)
                    .foregroundColor(.black)
                Spacer()
                NavigationLink {
                    GetPhoneNumberVerificationScreen()
                } label: {
                    Text("SKIPPP BUTTONNNNNNNNNNNNNNNN")
                        .foregroundColor(.black)
                }
                NavigationLink {
                    GetPhoneNumberVerificationScreen()
                } label: {
                    getVerificationButton
                }
                .disabled(phoneNumber.count != expectedPhoneLength)
            }
                }
        .padding(10)
        .onAppear{
            userInFocus = true
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(Color.white.ignoresSafeArea())
        .preferredColorScheme(.light)
    }
    
    
    var phoneInfo: some View {
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
}

struct GetPhoneNumberScreen_Previews: PreviewProvider {
    static var previews: some View {
        GetPhoneNumberScreen()
    }
}


extension GetPhoneNumberScreen {
    
    var getVerificationButton: some View {
        HStack{
            Text("Get Verification")
                .RoundedLongFilledButtonStyle(
                    foregroundColor: .white,
                    backgroundColor: Color.gray,
                    backgroundGradient:
                        phoneNumber.count == expectedPhoneLength ? BackgroundGradient : nil
                )
                
                .shadow(color: Color("PrimaryColor"),
                    radius: phoneNumber.count == expectedPhoneLength ? 2 : 0)
                .padding()
        }
        .frame(maxWidth: .infinity)
    }
    
    var dismissButton: some View {
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
