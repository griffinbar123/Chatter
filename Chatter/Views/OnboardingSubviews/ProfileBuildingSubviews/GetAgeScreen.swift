//
//  GetAgeScreen.swift
//  Chatter
//
//  Created by Griffin Barnard on 4/30/23.
//

import SwiftUI

struct GetAgeScreen: View {
    @AppStorage("onboarding_int") var onboardingScreen = 0
    
    @AppStorage("month") var userMonth: String = ""
    @AppStorage("day") var userDay: String = ""
    @AppStorage("year") var userYear: String = ""
    
    /// holds the month day and year the user eters
    @State var month: String = ""
    @State var day: String = ""
    @State var year: String = ""
    
    @State var ageAsDate: Date = Date.now
    
    // keeps track of whcich box we are on
    @FocusState private var focusIndex: Int?
    
    // number of wrong attemps, used in animation
    @State var attempts: Int = 0
    
    // keeps track if the user previously attempted an incorrect value
    @State private var incorrectValuedAttempted: Bool = false
    
    var body: some View {
        ZStack{
            backButton
            VStack {
                Text("When is your birthday?")
                    .SignUpTitleStyle()
                Text("With no photos, it might be useful for you to at least have a name. Just sayin’")
                    .SignUpDescriptionStyle()
                HStack (spacing: 8) {
                    monthTextBox
                    dayTextBox
                    yearTextBox
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .padding(.top, 5)
                .padding(.horizontal, 25)
                .modifier(Shake(animatableData: CGFloat(attempts)))
                
                if incorrectValuedAttempted { // displays after incorrect code attempt was made
                    incorrectText
                }
                
                Spacer()
                nextButton
            }
        }
        .OnboardingScreenStyle()
        .onAppear {
            fetchState()
            
            // initializes focus index. as a FocusState it needs to be done this way
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                focusIndex = 0
            }
        }
    }
}

// views for GetAgeScreen
extension GetAgeScreen {
    
    /// displays after incorrect code attempt was made
    private var incorrectText: some View {
        Text("Invalid date. Please try again")
            .IncorrectTextStyle()
    }
    
    /// text box for user entered year
    private var yearTextBox: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text("Year")
                .InputLabelStyle()
            TextField("", text: $year)
                .SignUpInputStyle(userInFocus: focusIndex == 2)
                .keyboardType(.numberPad)
                .focused($focusIndex, equals: 2)
                .onSubmit {
                    goForward()
                }
                .onTapGesture {
                    focusIndex = 2
                }
        }
        .frame(maxWidth: 125)
    }
    
    /// text box for user entered day
    private var dayTextBox: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text("Day")
                .InputLabelStyle()
            TextField("", text: $day)
                .SignUpInputStyle(userInFocus: focusIndex == 1)
                .keyboardType(.numberPad)
                .focused($focusIndex, equals: 1)
                .onChange(of: day, perform: { newValue in
                    if (day.count == 2) {
                        focusIndex = 2
                    }
                })
                .onTapGesture {
                    focusIndex = 1
                }
                .onSubmit {
                    if (day.count == 1){
                        day = "0" + day
                        focusIndex = 2
                    }
                }
        }
        .frame(maxWidth: 90)
    }
    
    /// text box for user entered month
    private var monthTextBox: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text("Month")
                .InputLabelStyle()
            TextField("", text: $month)
                .SignUpInputStyle(userInFocus: focusIndex == 0)
                .keyboardType(.numberPad)
                .focused($focusIndex, equals: 0)
                .onChange(of: month, perform: { newValue in
                    if (month.count == 2) {
                        focusIndex = 1
                    }
                })
                .onTapGesture {
                    focusIndex = 0
                }
                .onSubmit {
                    if (month.count == 1){
                        month = "0" + month
                        focusIndex = 1
                    }
                }
        }
        .frame(maxWidth: 90)
    }
    
    /// button that handles sending the user to the next page
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
                        boolClosure: checkIfValidDate,
                        fontSize: 18
                    )
                    
            }
            .frame(maxWidth: .infinity)
            .disabled(!checkIfValidDate())
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

// functions for GetAgeScreen
extension GetAgeScreen {
    
    /// sends user to the next screen
    private func goForward() {
        if checkIfValidDate() {
            saveState()
            onboardingScreen += 1
        } else {
            resetBoxes()
        }
    }
    
    // saves state to app storage
    private func saveState(){
        userDay = day
        userMonth = month
        userYear = year
    }
    
    // ge5s state to app storage
    private func fetchState(){
        day = userDay
        month = userMonth
        year = userYear
    }
    
    /// goes back to previous screen
    private func goBack() {
        saveState()
        onboardingScreen -= 1
    }
    
    /// checks if the date is valid
    private func checkIfValidDate() -> Bool {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let date = dateFormatter.date(from: year + "-" + month + "-" + day) {
            ageAsDate = date
            if (year.count != 4 || !checkIfOfAge(date: date) || date > Date.now || date < Date.now.addOrSubtractYear(year: -120)) {
                return false
            }
            
            return true
        } else {
            return false
        }
    }
    
    private func checkIfOfAge(date: Date) -> Bool {
        if date.addOrSubtractYear(year: 18) > Date.now {
            return false
        } else {
            return true
        }
    }
    
    /// resets boxes and does an animation. called when incorrect date is dont
    private func resetBoxes() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.0005) {
            withAnimation {
                attempts += 1
                incorrectValuedAttempted = true
            }
            month = ""
            day = ""
            year = ""
        }
    }
}

extension Date {
    func isBetween(_ date1: Date, and date2: Date) -> Bool {
        return (min(date1, date2) ... max(date1, date2)).contains(self)
    }
    
    func addOrSubtractDay(day:Int)->Date{
      return Calendar.current.date(byAdding: .day, value: day, to: self)!
    }

    func addOrSubtractMonth(month:Int)->Date{
      return Calendar.current.date(byAdding: .month, value: month, to: self)!
    }

    func addOrSubtractYear(year:Int)->Date{
      return Calendar.current.date(byAdding: .year, value: year, to: self)!
    }
}

struct GetAgeScreen_Previews: PreviewProvider {
    static var previews: some View {
        GetAgeScreen()
    }
}
