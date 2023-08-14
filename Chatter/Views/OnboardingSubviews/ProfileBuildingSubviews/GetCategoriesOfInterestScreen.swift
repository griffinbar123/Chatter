//
//  CategoriesOfInterestScreen.swift
//  Chatter
//
//  Created by Griffin Barnard on 5/2/23.
//

import SwiftUI

// struct to store a sepcific item. this way I can reference an item by its parent title and its name.
struct CategoryItem: Codable {
    let categoryTitle: String
    let categoryItem: String
}

struct GetCategoriesOfInterestScreen: View {
    @AppStorage("onboarding_int") var onboardingScreen = 0
    @AppStorage("selected_items") var selected: String = ""
    
    @State var selectedItems: [CategoryItem] = []
    let maxItems: Int = 6
    let requiredItemCount: Int = 3
    
    var body: some View {
        ZStack {
            backButton
            
            interestCount
            
            VStack {
                Text("Categories of interest.")
                    .SignUpTitleStyle()
                
                Text("To help us get to know you, pick at least 5 items that you find intereting")
                    .SignUpDescriptionStyle()
                
                categoriesOfInterestView
                
                Spacer()
                nextButton
            }
        }
        .OnboardingScreenStyle(disableTrailingPadding: true)
        .onAppear {
            if let items: [CategoryItem] = Bundle.main.decode(input: selected) {
                selectedItems = items
            }
        }
    }
}

extension Bundle {
    func decode<T: Decodable>(input: String) -> T? {
        
        let json  = Data(input.utf8)
        
        let decoder = JSONDecoder()
        
        do {
            let data = try decoder.decode(T.self, from: json)
            return data
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    func encode(input: [CategoryItem]) -> String? {

        
        do {
            let jsonData = try JSONEncoder().encode(input)
            let jsonString = String(data: jsonData, encoding: .utf8)!
            return jsonString
        } catch { print(error) }
        return nil
    }
}




// views for GetCategoriesOfInterestScreen
extension GetCategoriesOfInterestScreen {
    
    private var categoriesOfInterestView: some View {
        ScrollView (showsIndicators: false) {
            VStack (alignment: .leading, spacing: 12) {
                ForEach(categoriesOfInterest, id: \.self) { category in
                    Text(category.categoryTitle)
                        .InputLabelStyle()
                        .bold()
                    ScrollView (.horizontal, showsIndicators: false) {
                        VStack(alignment: .leading) {
                            HStack (spacing: 5) {
                                ForEach(0..<category.categoryItems.count , id: \.self) { index in
                                    if index % 2 == 0 {
                                        
                                        let item: CategoryItem = CategoryItem(
                                            categoryTitle: category.categoryTitle,
                                            categoryItem: category.categoryItems[index])

                                        categoryItem(item: item, selectedItems: $selectedItems)
                                    }
                                }
                            }
                            HStack (spacing: 5) {
                                ForEach(0..<category.categoryItems.count , id: \.self) { index in
                                    if index % 2 != 0 {
                                        
                                        let item: CategoryItem = CategoryItem(
                                            categoryTitle: category.categoryTitle,
                                            categoryItem: category.categoryItems[index])

                                        categoryItem(item: item, selectedItems: $selectedItems)
                                    }
                                }
                            }
                        }
                    }
                    .padding(.bottom, 30)
                }
            }
        }
        .padding(.leading, 15)
    }
    
    private var interestCount: some View {
        Text("\(selectedItems.count)/\(requiredItemCount)")
            .foregroundColor(.gray)
            .font(.largeTitle)
            .position(x: UIScreen.main.bounds.width - 60, y: 12)
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
                        boolClosure: checkIfEnoughItemsSelected,
                        fontSize: 18
                    )
                    
            }
            .frame(maxWidth: .infinity)
        }
        .disabled(!checkIfEnoughItemsSelected())
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
        }
        .position(x:24, y: 11)
    }
}

// functions for GetCategoriesOfInterestScreen
extension GetCategoriesOfInterestScreen {
    
    
    // checks if enough items have been checked
    private func checkIfEnoughItemsSelected() -> Bool {
        return selectedItems.count >= requiredItemCount
    }
    
    /// sends user to the next screen
    private func goForward() {
        if let sel = Bundle.main.encode(input: selectedItems) {
            selected = sel
        }
        onboardingScreen += 1
    }
    
    /// sends user to the last screen the user was at
    private func goBack() {
        if let sel = Bundle.main.encode(input: selectedItems) {
            selected = sel
        }
        onboardingScreen -= 1
    }
}



// view to hold a category Item
struct categoryItem: View {
    let item: CategoryItem
    
    @Binding var selectedItems: [CategoryItem]
    
    var body: some View {
        Text(item.categoryItem)
            .padding(7)
            .padding(.horizontal, 11)
            .background(
                checkIfItemInArray(item: item) ? Color("PrimaryColor").cornerRadius(90) : Color.white
                    .cornerRadius(90)
                )
            .onTapGesture {
                handleTap(item: item)
            }
            .BorderStyle(isSelected: !checkIfItemInArray(item: item), color1: .gray, color2: .gray.opacity(0.0), lineWidth: 2)
            .padding(1)
//            .foregroundColor(checkIfItemInArray(item: item) ? Color.white : Color.black)
    }
}

// functions for category Item
extension categoryItem {
    
    private func handleTap(item: CategoryItem) {
        if checkIfItemInArray(item: item) {
            removeFromSelectedItems(item: item)
        } else if selectedItems.count <= 9 {
            addToSelectedItems(item: item)
        }
    }
    
    /// adds item to array
    private func addToSelectedItems(item: CategoryItem) {
        selectedItems.append(item)
    }
    
    /// removes item from array
    private func removeFromSelectedItems(item: CategoryItem) {
        for index in 0..<selectedItems.count {
            if selectedItems[index].categoryItem == item.categoryItem &&
                selectedItems[index].categoryTitle == item.categoryTitle {
                selectedItems.remove(at: index)
                break
            }
        }
    }
    
    /// checks if item in array
    private func checkIfItemInArray(item: CategoryItem) -> Bool {
        var isSelected = false
        
        for selectedItem in selectedItems {
            if item.categoryItem == selectedItem.categoryItem &&
                item.categoryTitle == selectedItem.categoryTitle {
                isSelected = true
                break
            }
        }
        
        return isSelected
    }
}

struct GetCategoriesOfInterestScreen_Previews: PreviewProvider {
    static var previews: some View {
        GetCategoriesOfInterestScreen()
    }
}
