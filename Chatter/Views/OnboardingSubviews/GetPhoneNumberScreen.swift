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
    
    
    
    var body: some View {
        ZStack{
            Color.white.ignoresSafeArea()
            
            dismissButton
                .position(x: UIScreen.main.bounds.width-38)

            VStack(alignment: .leading){
                Text("Hey, can we get your number?")                    .SignUpTitleStyle()
                Text("Thought you were kinda cute ;)")
                    .SignUpDescriptionStyle()
                TextInput
                    .padding(.horizontal, 25)
                    .padding(.top, 25)
                Spacer()
                
                NavigationLink {
                    GetPhoneNumberVerificationScreen()
                } label: {
                    GetVerificationButton
                }
            }
                }
        .padding(10)
        .onAppear{
            userInFocus = true
        }
    }
    
    var GetVerificationButton: some View {
        HStack{
            Text("Get Verification")
                .RoundedLongFilledButtonStyle(
                    foregroundColor: .white,
                    backgroundColor: Color("white"),
                    backgroundGradient: BackgroundGradient
                )
                .shadow(color: Color("PrimaryColor"), radius: 2)
                .padding()
        }
        .frame(maxWidth: .infinity)
    }
    
    var TextInput: some View {
        HStack(spacing: 10){
            TextField("", text: $phoneNumber)
                .frame(width: 60, height: 55)
                .padding(.leading)
                .background(Color.gray.brightness(0.3))
                .cornerRadius(10)
            
            TextField("", text: $phoneNumber)
                .focused($userInFocus)
                .frame(height: 55)
                .frame(maxWidth: 200)
                .padding(.leading)
                .background(Color.gray.brightness(0.3))
                .cornerRadius(10)
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
