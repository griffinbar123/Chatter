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
                Text("With no photos, it might be useful for you to at least have a name. Just sayin’")
                    .SignUpDescriptionStyle()
                VStack {
                    Text("First Name")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 25)
                        .bold()
                        .font(.system(size:16))
                        .offset(y:8)
                    TextField("", text: $firstName)
                        .SignUpInputStyle()
                        .padding(.horizontal, 25)
                        .focused($focusIndex, equals: 0)
                        .onSubmit {
                            focusIndex = 1
                        }
                        .onTapGesture {
                            focusIndex = 0
                        }
                    Text("Last Name (Optional)")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 25)
                        .bold()
                        .font(.system(size:16))
                        .offset(y:8)
                    TextField("", text: $lastName)
                        .SignUpInputStyle()
                        .padding(.horizontal, 25)
                        .focused($focusIndex, equals: 1)
                        .onSubmit {
                            goForward()
                        }
                        .onTapGesture {
                            focusIndex = 1
                        }
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
