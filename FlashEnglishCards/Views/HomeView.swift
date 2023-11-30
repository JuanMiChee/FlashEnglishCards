//
//  ContentView.swift
//  FlashEnglishCards
//
//  Created by Juan Harrington on 9/11/23.
///

import SwiftUI

@available(iOS 16.0, *)
struct HomeView: View {
    
    @StateObject var viewModel: HomeViewViewModel
    
    
    var body: some View {
        TabView {
            ZStack {
                Color("mainBackgroundColour")
                    .ignoresSafeArea()
                VStack {
                    Text("Welcome to your flashcard app!")
                        .font(.system(size: 40, weight: .bold))
                        .padding()
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                    ScrollView {
                        ForEach(viewModel.viewContent.texts) { text in
                            FlashCardSectionView(title: text.text, progresBarColor: .red, progresBarCurrentProgress: 50, progressBarFinishProgress: 10)
                        }
                        
                    }
                }
                plusButtonView
            }
            .sheet(isPresented: $viewModel.isSheetPresented) {
                //Sheet view, you can also see it below
                sheetView
            }
            .tabItem {
                Image(systemName: "house")
                Text("Nearby")
            }
            .toolbarBackground(.white, for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
            .toolbarColorScheme(.light, for: .tabBar)
        }
    }
    
    var plusButtonView: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button("+") {
                    viewModel.AddCardButtonTrigger()
                }
                .buttonStyle(PlusButtonStyle(desiredBackgroundColor: Color(UIColor.white)))
            }
        }
    }
    
    //Here is the sheet view
    var sheetView: some View {
        AddNewCategoryView()
    }
    
    var addNewCardSheet: some View {
        ZStack {
            Color("mainBackgroundColour")
            VStack {
                Spacer()
                Spacer()
                Text("Add your category tittle.")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundColor(Color(.white))
                TextField(
                    "card name",
                    text: $viewModel.newCardTittle
                )
                .padding()
                .background(Color(.white))
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.gray, lineWidth: 5)
                )
                .cornerRadius(20)
                .padding(.horizontal, 20)
                .padding(.bottom)
                Spacer()
                Button("Save") {
                    
                }
                .buttonStyle(MainButtonStyle())
                Button("Cancel") {
                    
                }
                .buttonStyle(MainButtonStyle())
                .padding(.bottom, 30)
            }
        }
        .ignoresSafeArea()
    }
}


@available(iOS 16.0, *)
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView.build()
    }
}


