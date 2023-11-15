//
//  ContentView.swift
//  FlashEnglishCards
//
//  Created by Juan Harrington on 9/11/23.
///

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel: HomeViewViewModel
    
    var body: some View {
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
                            .onTapGesture {
                                viewModel.isCardMoreInfoViewToggled = true
                            }
                    }
                }
            }
            //PlusButtonView, you can see it below
            plusButtonView
        }
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
    }
    
    var plusButtonView: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button("+") {
                    viewModel.AddCardButtonTrigger()
                }
                .buttonStyle(PlusButtonStyle(desiredBackgroundColor: Color(UIColor.systemYellow)))
            }
        }
    }
    
    //Mark: Sheets
    
    var addNewCardSheet: some View {
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
            .padding(.bottom)
            
            Text("Woukd you like to add a description?")
                .font(.title3)
                .foregroundColor(Color(UIColor.systemGray))
            TextEditor(
                text: $viewModel.moreInfoText
            )
            .frame(height: 150)
            .padding()
            .background(Color(UIColor.systemGray5))
            .border(Color(UIColor.systemGray3), width: 1)
            .cornerRadius(20)
            .padding(.horizontal, 20)
            
            Button("Done") {
                viewModel.doneButtonTrigger()
            }
            .buttonStyle(MainButtonStyle(desiredBackgroundColor: Color(UIColor.systemGreen)))
            Button("Cancel") {
                viewModel.cancelButtonTrigger()
            }
            .buttonStyle(MainButtonStyle(desiredBackgroundColor: Color.red))
        }
    }
    
    var cardMoreInfoViewSheet: some View {
        CardMoreInfoView(moreInfoText: "")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView.build()
    }
}


