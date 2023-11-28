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
<<<<<<< Updated upstream
        ZStack {
            VStack {
                Text(viewModel.newCardTittle)
                Text("*Wanna learn something today?*")
                    .font(.title)
                    .padding(.top)
                    .foregroundColor(Color(UIColor.systemGray))
                Text("¿Quieres aprender algo hoy?")
                    .font(.title3)
                    .foregroundColor(Color(UIColor.systemGray3))
                ScrollView {
                    ForEach(viewModel.viewContent.texts) { text in
                        FlashCardView(text: text.text)
=======
        TabView {
            ZStack {
                Color("mainBackgroundColor")
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
                                .onTapGesture {
                                    viewModel.isCardMoreInfoViewToggled = true
                                }
                        }
>>>>>>> Stashed changes
                    }
                }
                //PlusButtonView, you can see it below
                plusButtonView
                
            }
<<<<<<< Updated upstream
            //PlusButtonView, you can see it below
            plusButtonView
        }
        .sheet(isPresented: $viewModel.isSheetPresented) {
            //Sheet view, you can also see it below
            sheetView
        }
        .onAppear {
            viewModel.asignCardsToView()
=======
            .sheet(isPresented: $viewModel.isAddNewCardSheetToggled) {
                //Sheet view, you can also see it below
                addNewCardSheet
            }
            .sheet(isPresented: $viewModel.isCardMoreInfoViewToggled) {
                //You can also see this card below
                cardMoreInfoViewSheet
            }
            .onAppear {
                viewModel.asignCardsToView()
            }
            .tabItem {
                Image(systemName: "house")
                Text("Nearby")
                    
            }
            .toolbarBackground(.white, for: .tabBar)
                        .toolbarBackground(.visible, for: .tabBar)
                        .toolbarColorScheme(.light, for: .tabBar)
>>>>>>> Stashed changes
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
    
<<<<<<< Updated upstream
    //Here is the sheet view
    var sheetView: some View {
        VStack {
            Text("*Name of your new card.*")
                .font(.title)
                .foregroundColor(Color(UIColor.systemGray))
            TextField(
                "Card name",
                text: $viewModel.newCardTittle
            )
            .padding()
            .background(Color(UIColor.systemGray5))
            .border(Color(UIColor.systemGray3), width: 1)
            .cornerRadius(20)
            .padding(.horizontal, 20)
            
            Button("Done") {
                viewModel.doneButtonTrigger()
=======
    //Mark: Sheets
    
    var addNewCardSheet: some View {
        ZStack {
            Color("mainBackgroundColor")
            VStack {
                Spacer()
                Spacer()
                Text("Add your card tittle.")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundColor(Color(.white))
                TextField(
                    "Card name",
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
                Text("Would you like to add a description?")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(Color(.white))
                TextEditor(
                    text: $viewModel.moreInfoText
                )
                .frame(height: 150)
                .padding()
                .background(Color(.white))
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.gray, lineWidth: 5)
                )
                .cornerRadius(20)
                .padding(.horizontal, 20)
                Spacer()
                Button("Done") {
                    viewModel.doneButtonTrigger()
                }
                .buttonStyle(MainButtonStyle())
                Button("Cancel") {
                    viewModel.cancelButtonTrigger()
                }
                .buttonStyle(MainButtonStyle())
                .padding(.bottom, 30)
>>>>>>> Stashed changes
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


