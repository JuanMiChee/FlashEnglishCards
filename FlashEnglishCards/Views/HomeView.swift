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
                Text(viewModel.sheetText)
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
                    }
                }
            }
            //PlusButtonView, you can see it below
            plusButtonView
        }
        .sheet(isPresented: $viewModel.isSheetPresented) {
            //Sheet view, you can also see it below
            sheetView
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
                    viewModel.isSheetPresented = true
                }
                .buttonStyle(PlusButtonStyle(desiredBackgroundColor: Color(UIColor.systemYellow)))
            }
        }
    }
    
    //Here is the sheet view
    var sheetView: some View {
        VStack {
            Text("*Name of your new card.*")
                .font(.title)
                .foregroundColor(Color(UIColor.systemGray))
            TextField(
                "Card name",
                text: $viewModel.sheetText
            )
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
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView.build()
    }
}


