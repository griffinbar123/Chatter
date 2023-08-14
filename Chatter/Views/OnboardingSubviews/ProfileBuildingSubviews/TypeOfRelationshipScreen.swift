//
//  GetInterestedGenderScreen.swift
//  Chatter
//
//  Created by Griffin Barnard on 4/30/23.
//

import SwiftUI




struct TypeOfRelationshipScreen: View {
    @AppStorage("onboarding_int") var onboardingScreen = 0
    
    let staticCircleSize: CGFloat = 90
    
    
    let riseTransition: AnyTransition = .asymmetric(
        insertion: .move(edge: .top),
        removal: .move(edge: .bottom))
    
    
    @State var show = false
    
    
    var body: some View {
        ZStack{
            
            backButton
            VStack {
                Text("Whatcha want?")
                    .SignUpTitleStyle()
                Text("Pick the kind of relationship you looking for. Do it no balls")
                        .SignUpDescriptionStyle()
                if show {
                    GeometryReader { geometry in
                        
                        
                        Circle()
                            .frame(width: staticCircleSize, height: staticCircleSize)
                            .foregroundColor(Color("PrimaryColor"))
                            .position(x: geometry.size.width*0.25, y: geometry.size.height*0.15)
                        
                        Circle()
                            .frame(width: staticCircleSize, height: staticCircleSize)
                            .foregroundColor(Color("PrimaryColor"))
                            .position(x: geometry.size.width*0.4, y: geometry.size.height*0.35)
                        
                        Circle()
                            .frame(width: staticCircleSize, height: staticCircleSize)
                            .foregroundColor(Color("PrimaryColor"))
                            .position(x: geometry.size.width*0.7, y: geometry.size.height*0.2)
                        
                        Circle()
                            .frame(width: staticCircleSize, height: staticCircleSize)
                            .foregroundColor(Color("PrimaryColor"))
                            .position(x: geometry.size.width*0.75, y: geometry.size.height*0.47)
                        
                        Circle()
                            .frame(width: staticCircleSize, height: staticCircleSize)
                            .foregroundColor(Color("PrimaryColor"))
                            .position(x: geometry.size.width*0.3, y: geometry.size.height*0.58)
                        
                        Circle()
                            .frame(width: staticCircleSize, height: staticCircleSize)
                            .foregroundColor(Color("PrimaryColor"))
                            .position(x: geometry.size.width*0.55, y: geometry.size.height*0.75)
                        
                    }
                    .transition(.move(edge: .top))
            }
            
            Spacer()
            nextButton
            }
            .onAppear {
                show = true
            }
        }
        .OnboardingScreenStyle()
    }
    
    private func getCenter(geo: GeometryProxy) -> (x: Double, y: Double) {
        return (x: geo.size.width / 2.0, y: geo.size.height / 2.0)
    }
    
}

// views for GetTypeOfRelationshipScreen
extension TypeOfRelationshipScreen {
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

// functions for GetTypeOfRelationshipScreen
extension TypeOfRelationshipScreen {
    private func goForward() {
        onboardingScreen += 1
    }
    private func goBack() {
        onboardingScreen -= 1
    }
}

struct TypeOfRelationshipScreen_Previews: PreviewProvider {
    static var previews: some View {
        TypeOfRelationshipScreen()
    }
}
