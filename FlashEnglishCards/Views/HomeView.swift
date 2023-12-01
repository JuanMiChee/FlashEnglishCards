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
        NavigationStack {
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
                                FlashCardSectionView(title: text.text,
                                                     progresBarCurrentProgress: text.numberOfCards,
                                                     progressBarFinishProgress: text.numberOfCompletedCards,
                                                     sectionSettingsClosure: {})
                                .onTapGesture {
                                    if let index = viewModel.viewContent.texts.firstIndex(of: text) {
                                        viewModel.currentCategoryTitle = viewModel.viewContent.texts[index].text
                                    }
                                    viewModel.navigateToCardsView = true
                                }
                            }
                        }
                        NavigationLink(destination: FlashCardsView(categoryTitle: viewModel.currentCategoryTitle,
                                                                   currentBarProgress: 1,
                                                                   finalBarProgress: 20), 
                                       isActive: $viewModel.navigateToCardsView) { EmptyView() }
                    }
                    plusButtonView
                }
                .onAppear {
                    viewModel.asignCardsToView()
                }
                .sheet(isPresented: $viewModel.isSheetPresented) {
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
        .navigationBarBackButtonHidden(true) 
        .navigationBarItems(leading: CustomBackButtonView())
        .navigationTitle("Inicio")
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
        AddNewCategoryView(cancelCompletion: {viewModel.cancelButtonTrigger()},
                           saveCompletion: { title in
            viewModel.saveButtonTrigger(title: title, numberofCards: 0, numberOfCompletedCards: 0)
        })
    }
}


@available(iOS 16.0, *)
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView.build()
    }
}


