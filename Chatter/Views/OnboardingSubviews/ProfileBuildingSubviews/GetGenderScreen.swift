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
    
    let imageHeightProportion: Double = 0.7
    let offset: Double = 0.0165
    
    var body: some View {
        ZStack{
            backButton
            if isMan {
                blueDolphin
            } else {
                blankBlueDolphin
            }
            if isWoman {
                pinkDolphin
            } else {
                blankPinkDolphin
            }
            
            VStack {
                Text("What's your gender?")
                    .SignUpTitleStyle()
                Text("Choose your gender. Nothing complicated here. Just two options. How progressive")
                    .SignUpDescriptionStyle()
                manAndWomanButtons

                Spacer()
                
                nextButton

            }
        }
        .OnboardingScreenStyle()
        
    }
}

// views for GetGenderScreen
extension GetGenderScreen {
    
    private var dolphins: some View {
        HStack (spacing:0) {
            blueDolphin
            pinkDolphin
        }
    }
    
    var blueDolphin: some View {
        Image("blue_dolphin")
            .resizable()
            .scaledToFit()
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * imageHeightProportion, alignment: .trailing)
//            .background(.red)
            .foregroundColor(.red)
            .position(
                x:UIScreen.main.bounds.width - (UIScreen.main.bounds.width * (1 + offset)),
                y:UIScreen.main.bounds.height-(imageHeightProportion*UIScreen.main.bounds.height/2.2))
    }
    
    var pinkDolphin: some View {
        Image("pink_dolphin")
            .resizable()
            .scaledToFit()
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * imageHeightProportion, alignment: .leading)
            .position(
                x:UIScreen.main.bounds.width * (1 - offset) - 8,
                y:UIScreen.main.bounds.height-(imageHeightProportion*UIScreen.main.bounds.height/2.2))
    }
    
    
    var blankBlueDolphin: some View {
        Image("blank_dolphin")
            .resizable()
            .scaledToFit()
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * imageHeightProportion, alignment: .trailing)
            .foregroundColor(.red)
            .position(
                x:UIScreen.main.bounds.width - (UIScreen.main.bounds.width * (1 + offset)),
                y:UIScreen.main.bounds.height-(imageHeightProportion*UIScreen.main.bounds.height/2.2))
    }
    
    var blankPinkDolphin: some View {
        Image("blank_dolphin")
            .resizable()
            .scaledToFit()
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * imageHeightProportion, alignment: .trailing)
            .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
            .position(
                x:UIScreen.main.bounds.width * (1 - offset) - 8,
                y:UIScreen.main.bounds.height-(imageHeightProportion*UIScreen.main.bounds.height/2.2))
    }
    
    private var manAndWomanButtons: some View {
        VStack {
            
            Text("Man")
                .foregroundColor(.black)
                .frame(width: UIScreen.main.bounds.width*0.8, height: 55)
                .overlay(
                        RoundedRectangle(cornerRadius: 90)
                            .stroke(isMan ? Color("PrimaryColor") : .gray, lineWidth: 3)
                    )
                .onTapGesture {
                    isMan.toggle()
                    isWoman = false
                }
            .padding(.bottom, 8)
            
            
            Text("Woman")
                .foregroundColor(.black)
                .frame(width: UIScreen.main.bounds.width*0.8, height: 55)
                .overlay(
                        RoundedRectangle(cornerRadius: 90)
                            .stroke(isWoman ? Color("PinkDolphinColor") : .gray, lineWidth: 3)
                    )
                .onTapGesture {
                    isMan = false
                    isWoman.toggle()
                }
            
        }
    }
    
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
    
    private func checkIfGenderSelected() -> Bool {
        return isMan || isWoman
    }
    
    private func goForward() {
        onboardingScreen += 1
    }
    
    private func goBack() {
        onboardingScreen -= 1
    }
    
}

struct GetGenderScreen_Previews: PreviewProvider {
    static var previews: some View {
        GetGenderScreen()
    }
}
