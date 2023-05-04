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
    
    // country code selected by user
    @State private var countryCode: String = "US"
    @State private var countryPhoneCode: String = "1"
    @State private var showCountries: Bool = false
    
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
                
                /// shows list of countries when showCountries toggles on
                .fullScreenCover(isPresented: $showCountries) {
                        ListOfCountries(countryCode: $countryCode,
                                        countryPhoneCode: $countryPhoneCode,
                                        expectedPhoneLength: $expectedPhoneLength)
                    }
            }
        }
        .OnboardingScreenStyle()
        .onAppear{
            userInFocus = true
        }
        
    }
}

// extension of views for Structs
extension GetPhoneNumberScreen {
    
    /// navlink to the phone number verfication screen
    private var verificationNavLink: some View {
        NavigationLink {
            GetPhoneNumberVerificationScreen()
        } label: {
            getVerificationButton // the button itself
        }
        .disabled(!checkIfValidPhoneNumber())
    }
    
    ///view to handle the two pieces of phone information
    private var phoneInfo: some View {
        HStack(spacing: 10){
            VStack (alignment:.leading, spacing: 2) {
                Text("Country")
                    .SmallInputLabelStyle()
                HStack(spacing: 3) {
                    // country codes
                    Text(countryCode + "  +" + countryPhoneCode)
                    
//                    Text(countryPhoneCode)
                    Image(systemName: "chevron.down")
                        .resizable()
                        .frame(width: 12, height: 7)
                        .offset(y: 2)
                }
                .frame(maxWidth: 80)
                .font(.system(size: 20))
                .SignUpInputStyle(userInFocus: false)
                .onTapGesture {
                    showCountries.toggle()
                }
            }
            
            VStack(alignment:.leading, spacing: 2) {
                Text("Phone")
                    .SmallInputLabelStyle()
                // phone number entry
                TextField("", text: $phoneNumber)
                    .focused($userInFocus)
                    .frame(maxWidth: 270)
                    .keyboardType(.numberPad)
                    .SignUpInputStyle(userInFocus: userInFocus)
            }
            Spacer()
        }
        .frame(maxWidth: 400)
        .offset(x: -8)
    }
    
    ///view to handle the verification button which sends the user to the next page at the bottom of the scren
    private var getVerificationButton: some View {
        HStack{
            Text("Get Verification")
                .RoundedLongFilledButtonStyle(
                    foregroundColor: .black,
                    backgroundColor: Color.gray,
                    backgroundGradient: BackgroundGradient,
                    boolClosure: checkIfValidPhoneNumber,
                    fontSize: 18
                )
                
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
    
    /// function to check if a phone number is valid
    private func checkIfValidPhoneNumber() -> Bool {
        return phoneNumber.count == expectedPhoneLength
    }
}

// view that only shows the list of countries and there codes. pop up when button to the left of phone entry is clicked, and pops down when selection is made
struct ListOfCountries: View {
    @Environment(\.dismiss) var dismiss
    @Binding var countryCode: String
    @Binding var countryPhoneCode: String
    @Binding var expectedPhoneLength: Int
    
    @State private var searchText = ""
    
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            Button {
                dismiss()
            } label: {
                Text("Cancel")
                    .foregroundColor(Color("PrimaryColor"))
                    .padding(.horizontal, 20)
            }
            NavigationStack {
                List {
                    ForEach(searchText.isEmpty ?
                            CountrySections : CountrySections.filter {
                    searchText
                        .lowercased()
                        .contains($0.sectionName.lowercased()) }, id: \.self)
                    { countrySection in
                
                        let content: [Country] = searchText.isEmpty ?
                        countrySection.section : countrySection.section.filter {$0.country.lowercased().contains(searchText.lowercased()) }
                        
                        Section (header: Text(content.count != 0 ? countrySection.sectionName : "")
                            .font(.system(size: 18))) {
                                ForEach(content, id: \.self) { country in
                                    HStack{
                                        Text(country.country)
                                        Spacer()
                                        Text("+\(country.isoCode)")
                                    }
                                    .foregroundColor(.black)
                                    .brightness(0.3)
                                    .onTapGesture {
                                        countryCode = country.code
                                        countryPhoneCode = country.isoCode
                                        getPhoneLength()
                                        dismiss()
                                    }
                                }
                            }
                        
                    }
                }
                .listStyle(.grouped)
                .preferredColorScheme(.light)
            }
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
            .padding(0)
            Spacer()
        }
        
    }
    
    // function to find the phone length of a given country. not every country  si in the list i made but i think thats okay for now TODO: maybe improve this
    private func getPhoneLength() {
        for country in countriesAndPhones {
            if country.code == countryCode {
                expectedPhoneLength = country.phoneLength
            }
        }
    }
}

//------ preview
struct GetPhoneNumberScreen_Previews: PreviewProvider {
    static var previews: some View {
        GetPhoneNumberScreen()
    }
}
