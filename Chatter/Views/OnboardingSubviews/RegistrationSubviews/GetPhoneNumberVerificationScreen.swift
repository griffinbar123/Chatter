//
//  PhoneNumberVerificationScreen.swift
//  Chatter
//
//  Created by Griffin Barnard on 4/30/23.
//

import SwiftUI

struct GetPhoneNumberVerificationScreen: View {
    @Environment(\.dismiss) private var dismiss
    @AppStorage("is_on_email") var isOnEmail: Bool = false
    
    //keeps track of whcich box we are on
    @FocusState private var focusIndex: Int?
    
    //keeps track of the correct code (fake code for now), userCode, and number of attemps
    @State private var expectedCode: String = "123456"
    @State private var userEnteredCode: [String] = ["", "", "", "", "", ""]
    @State var attempts: Int = 0
    
    //keeps track if the user previously attempted an incorrect value
    @State private var incorrectValuedAttempted: Bool = false
    
    var body: some View {
        ZStack{
            
            reEnterPhoneNumber //button to send user back to phone number screen
                .position(x:24)
            
            VStack(alignment: .leading) {
                // title and description
                Text("We just texted you")
                    .SignUpTitleStyle()
                Text("Enter the code below so we can get each other’s numbers 👀")
                    .SignUpDescriptionStyle()
                
                codeEntryBoxes //where user enters their code
                    .foregroundColor(.black)
                
                if incorrectValuedAttempted { // displays after incorrect code attempt was made
                    Text("Incorrect code. Please try again")
                        .foregroundColor(.red)
                        .padding(.vertical, 15)
                        .padding(.horizontal, 30)
                }
                
                resendCode // resend code prompt
                Spacer()
            }
        }
        .OnboardingScreenStyle()
        .navigationBarBackButtonHidden()
        .onAppear {
            // initializes focus index. as a FocusState it needs to be done this way
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                focusIndex = 0
            }
        }
    }
    
}

//extension of views
extension GetPhoneNumberVerificationScreen {
    
    private var codeEntryBoxes: some View {
        HStack {
            /// iterate through the userEnteredCode array and make  textobject ofr each element
            ForEach(0..<$userEnteredCode.count, id: \.self) { index in
               ///textfield object
                TextField(userEnteredCode[index], text: $userEnteredCode[index])
                    .focused($focusIndex, equals: index)
                    .keyboardType(.numberPad)
                    .padding(8)
                    .frame(
                        width: UIScreen.main.bounds.width/CGFloat(userEnteredCode .count) - 15,
                        height:UIScreen.main.bounds.width/CGFloat(userEnteredCode.count) - 15)
                    .background(Color("textBackground"))
                    .cornerRadius(10)
                    .font(.system(size:26))
                    .minimumScaleFactor(0.01)
                    .multilineTextAlignment(.center)
                    .onChange(of: userEnteredCode[index]) {_ in
                        focusNextField(from: index)
                    }
                    .modifier(Shake(animatableData: CGFloat(attempts)))
                    
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.top, 30)
    }
    
    /// button to go back to previous page and renter a phone number
    private var reEnterPhoneNumber: some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: "lessthan")
                .resizable()
                .foregroundColor(.gray)
                .frame(width: 17, height: 33)
                .padding(.top, 30)
        }
    }
    
    /// view to resend code. ontap fire sendCode function (not hooked up)
    private var resendCode: some View {
        Text("Resend Code")
            .underline()
            .font(.system(size: 16))
            .foregroundColor(Color.blue)
            .padding(.top, 15)
            .padding(.leading, 25)
            .onTapGesture {
                sendCode()
            }
    }
}

extension GetPhoneNumberVerificationScreen {
    
    // TODO: fill this in with correct functionality
    private func sendCode(){
        print("Resending Code")
    }
    
    ///checks code for correctness, and handles both coases
    private func checkCodes() {
        if expectedCode == collectUserEnteredCode() {
            isOnEmail = true
        } else {
            userEnteredCode = ["", "", "", "", "", ""]
            withAnimation {
                attempts += 1
            }
            incorrectValuedAttempted = true
        }
    }
    
    ///helper function to get the userEnteredCode as a string becuase it is stored as an array
    private func collectUserEnteredCode() -> String {
        var code: String = ""
        for char in userEnteredCode {
            code += char
        }
        return code
    }
    
    ///function to move the focus of the keyoard to the next section. if all sections full chekc if the entered code is correct
    private func focusNextField(from index: Int) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.001) {
            focusIndex = getCodeLength()
            if getCodeLength() == 6 {
                checkCodes()
            }
        }
    }
    
    ///helper function to get the amount of characters entered. Used because we store the codes in 6 different sections
    func getCodeLength()  -> Int {
        var count: Int = 0
        for char in  userEnteredCode {
            if char  != "" {
                count += 1
            }
        }
        return count
    }
}

extension Binding {
    ///on change handler. detects when a binded value changes. not using this here, but still useful
    func onChange(_ handler: @escaping (Value) -> Void) -> Binding<Value> {
        Binding(
            get: { self.wrappedValue },
            set: { newValue in
                self.wrappedValue = newValue
                handler(newValue)
            }
        )
    }
}

///shake effect
struct Shake: GeometryEffect {
    var amount: CGFloat = 10
    var shakesPerUnit = 3
    var animatableData: CGFloat = 1

    func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(CGAffineTransform(translationX:
            amount * sin(animatableData * .pi * CGFloat(shakesPerUnit)),
            y: 0))
    }
}







//------ preview
struct GetPhoneNumberVerificationScreen_Preview: PreviewProvider {
    static var previews: some View {
        GetPhoneNumberVerificationScreen()
    }
}
