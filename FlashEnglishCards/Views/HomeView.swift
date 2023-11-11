//
//  ContentView.swift
//  FlashEnglishCards
//
//  Created by Juan Harrington on 9/11/23.
///

import SwiftUI



struct HomeView: View {
    
    @ObservedObject var viewModel = HomeViewViewModel(dependencies: HomeViewViewModel.Dependencies(getCards: GetCardsUseCase()))
    
    var body: some View {
        VStack {
            Text("Wanna learn something today?")
                .font(.title2)
                .padding(.top)
            Text("¿Quieres aprender algo hoy?")
                .font(.title3)
                .foregroundColor(.gray)
            ScrollView {
                ForEach(viewModel.viewContent.texts) { text in
                    FlashCardView(text: text.text)
                }
            }
            
            Button("+") {
                
            }
            .padding()
            .background(Color.yellow)
            .cornerRadius(10)
            .shadow(color: Color.gray, radius: 4, x: 0, y: 4)
        }
        .onAppear {
            viewModel.asignCards()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
