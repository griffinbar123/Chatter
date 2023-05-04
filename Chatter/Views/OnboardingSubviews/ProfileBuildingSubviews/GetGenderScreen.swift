//
//  GetGenderScreen.swift
//  Chatter
//
//  Created by Griffin Barnard on 4/30/23.
//

import SwiftUI

struct GetGenderScreen: View {
    @AppStorage("onboarding_int") var onboardingScreen = 0
    
    @State var isMan: Bool = false
    @State var isWoman: Bool = false
    
    var body: some View {
        ZStack{
            backButton

            VStack {
                Text("What's your gender?")
                    .SignUpTitleStyle()
                Text("Choose your gender. Nothing complicated here. Just two options. How progressive")
                    .SignUpDescriptionStyle()
                
                dolphins
                
                Spacer()
                manAndWomanButtons

                nextButton

            }
        }
        .OnboardingScreenStyle()
        
    }
}

// views for GetGenderScreen
extension GetGenderScreen {
    
    /// handle shswoing the dolphins
    private var dolphins: some View {
        HStack (spacing:0) {
            if isMan {
                blueDolphin
                    .offset(x:3)
                    .zIndex(2)
            } else {
                blankBlueDolphin
                    .offset(x:3)
                    .zIndex(1)
            }
            if isWoman {
                pinkDolphin
                    .offset(x:-3)
                    .zIndex(2)
            } else {
                blankPinkDolphin
                    .offset(x:-3)
                    .zIndex(1)
            }
        }
        .padding()
    }
    
    /// blue dolphin, only shows up when a gender of man has been picked
    var blueDolphin: some View {
        Image("blue_dolphin")
            .resizable()
            .scaledToFit()
    }
    
    /// pink dolphin, only shows up when a gender of woman has been picked
    var pinkDolphin: some View {
        Image("pink_dolphin")
            .resizable()
            .scaledToFit()
    }
    
    /// black dolphin, only shows up when a gender of man has not been picked
    var blankBlueDolphin: some View {
        Image("blank_dolphin")
            .resizable()
            .scaledToFit()
    }
    
    /// pink dolphin, only shows up when a gender of woman has not been picked
    var blankPinkDolphin: some View {
        Image("blank_dolphin")
            .resizable()
            .scaledToFit()
            .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
    }
    
    /// man and woman buttons
    private var manAndWomanButtons: some View {
        VStack {
            
            Text("Man")
                .foregroundColor(.black)
                .frame(width: UIScreen.main.bounds.width*0.8, height: 55)
                .contentShape(Rectangle())
                .overlay(
                        RoundedRectangle(cornerRadius: 90)
                            .stroke(isMan ? Color("BlueDolphinColor") : .gray, lineWidth: 3)
                    )
                .onTapGesture {
                    isMan.toggle()
                    isWoman = false
                }
            .padding(.bottom, 8)
            
            
            Text("Woman")
                .foregroundColor(.black)
                .frame(width: UIScreen.main.bounds.width*0.8, height: 55)
                .contentShape(Rectangle())
                .onTapGesture {
                    isMan = false
                    isWoman.toggle()
                }
                .overlay(
                        RoundedRectangle(cornerRadius: 90)
                            .stroke(isWoman ? Color("PinkDolphinColor") : .gray, lineWidth: 3)
                    )
                .padding(.bottom, 8)
            
        }
    }

    /// button to go forward
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
                        boolClosure: checkIfGenderSelected,
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

// functions for GetGenderScreen
extension GetGenderScreen {
    
    // checks if a gender is selected
    private func checkIfGenderSelected() -> Bool {
        return isMan || isWoman
    }
    
    // move screen forward
    private func goForward() {
        onboardingScreen += 1
    }
    
    // move screen back
    private func goBack() {
        onboardingScreen -= 1
    }
    
}

struct GetGenderScreen_Previews: PreviewProvider {
    static var previews: some View {
        GetGenderScreen()
    }
}
