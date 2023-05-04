//
//  CategoriesOfInterestScreen.swift
//  Chatter
//
//  Created by Griffin Barnard on 5/2/23.
//

import SwiftUI

// struct to store a sepcific item. this way I can reference an item by its parent title and its name.
struct CategoryItem {
    let categoryTitle: String
    let categoryItem: String
}

struct GetCategoriesOfInterestScreen: View {
    @AppStorage("onboarding_int") var onboardingScreen = 0
    
    @State var selectedItems: [CategoryItem] = []
    let maxItems: Int = 10
    let requiredItemCount: Int = 5
    
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
        .OnboardingScreenStyle()
        
    }
}

// views for GetCategoriesOfInterestScreen
extension GetCategoriesOfInterestScreen {
    
    private var categoriesOfInterestView: some View {
        ScrollView (showsIndicators: false) {
            VStack (alignment: .leading, spacing: 10) {
                ForEach(categoriesOfInterest, id: \.self) { category in
                    Text(category.categoryTitle)
                        .font(.largeTitle)
                        .bold()
                    ScrollView (.horizontal, showsIndicators: false) {
                        VStack(alignment: .leading) {
                            HStack (spacing: 5) {
                                ForEach(0..<category.categoryItems.count , id: \.self) { index in
                                    if index % 2 == 0 {
                                        
                                        let item: CategoryItem = CategoryItem(
                                            categoryTitle: category.categoryTitle,
                                            categoryItem: category.categoryItems[index])

                                        Text(item.categoryItem)
                                            .padding(8)
                                            .padding(.horizontal, 12)
                                            .background(
                                                checkIfItemInArray(item: item) ? Color.orange.cornerRadius(90) : Color("PrimaryColor")
                                                    .cornerRadius(90)
                                                )
                                            .onTapGesture {
                                                if checkIfItemInArray(item: item) {
                                                    removeFromSelectedItems(item: item)
                                                } else if selectedItems.count < 9 {
                                                    addToSelectedItems(item: item)
                                                }
                                            }
                                    }
                                }
                            }
                            HStack (spacing: 5) {
                                ForEach(0..<category.categoryItems.count , id: \.self) { index in
                                    if index % 2 != 0 {
                                        
                                        let item: CategoryItem = CategoryItem(
                                            categoryTitle: category.categoryTitle,
                                            categoryItem: category.categoryItems[index])

                                        Text(item.categoryItem)
                                            .padding(8)
                                            .padding(.horizontal, 12)
                                            .background(
                                                checkIfItemInArray(item: item) ? Color.orange.cornerRadius(90) : Color("PrimaryColor")
                                                    .cornerRadius(90)
                                                )
                                            .onTapGesture {
                                                if checkIfItemInArray(item: item) {
                                                    removeFromSelectedItems(item: item)
                                                } else {
                                                    addToSelectedItems(item: item)
                                                }
                                            }
                                    }
                                }
                            }
                        }
                    }
                    .padding(.bottom, 16)
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
    
    /// adds item to array
    private func addToSelectedItems(item: CategoryItem) {
        selectedItems.append(item)
    }
    
    /// removes item from array
    private func removeFromSelectedItems(item: CategoryItem) {
        for index in selectedItems.indices {
            if selectedItems[index].categoryItem == item.categoryItem &&
                selectedItems[index].categoryTitle == item.categoryTitle {
                selectedItems.remove(at: index)
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
    
    /// sends user to the next screen
    private func goForward() {
        onboardingScreen += 1
    }
    
    /// sends user to the last screen the user was at
    private func goBack() {
        onboardingScreen -= 1
    }
}

struct GetCategoriesOfInterestScreen_Previews: PreviewProvider {
    static var previews: some View {
        GetCategoriesOfInterestScreen()
    }
}
