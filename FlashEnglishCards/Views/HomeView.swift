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
                    VStack() {
                        Text("Welcome to your flashcard app!")
                            .font(.system(size: 40, weight: .bold))
                            .padding()
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                        ScrollView {
                            categoriesView
                        }
                        NavigationLink(destination: FlashCardsView.build(categoryTitle: viewModel.currentCategoryTitle),
                                       isActive: $viewModel.isNavigateToCardsViewToggled) { EmptyView() }
                    }
                    plusButtonView
                }
                .onAppear {
                    viewModel.handleViewAppeared()
                }
                .sheet(isPresented: $viewModel.isAddNewCardSheetShown) {
                    addNewCategorySheet
                }
                
                .sheet(isPresented: $viewModel.isEditCardSheetShown) {
                    editCategorySheet
                }
                .tabItem {
                    Image(systemName: "house")
                    Text("DashBoard")
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
    
    var categoriesView: some View {
        VStack {
            ForEach(viewModel.viewContent.flashCardCategories) { categorie in
                viewModel.buildFlashCardView(category: categorie)
                .onTapGesture {
                    viewModel.aCategoryGetsTapped(category: categorie)
                }
            }
        }
    }
    
    var plusButtonView: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button("+") {
                    viewModel.AddCardCategoryButtonTrigger()
                }
                .buttonStyle(PlusButtonStyle(desiredBackgroundColor: Color(UIColor.white)))
            }
        }
    }
    
    var addNewCategorySheet: some View {
        AddNewCategoryView(cancelCompletion: {viewModel.cancelButtonTrigger()},
                           saveCompletion: { title in
            viewModel.saveButtonTrigger(title: title,
                                        numberOfCompletedCards: 0)
        })
    }
    
    var editCategorySheet: some View {
        EditCategoryView(cancelCompletion: { 
            viewModel.cancelButtonTrigger()
        },
                         saveCompletion: { title in
            viewModel.viewContent.flashCardCategories[viewModel.currentCardIndex].text = title
            viewModel.saveCurrentCards()
            viewModel.isEditCardSheetShown = false
        })
    }
}


@available(iOS 16.0, *)
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView.build()
    }
}


