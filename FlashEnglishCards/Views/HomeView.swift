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
    TabView {
      NavigationStack {
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
            .padding(.bottom, 100)
          }
          plusButtonView
        }
        .onAppear {
          viewModel.handleViewAppeared()
        }
        .navigationDestination(isPresented: $viewModel.isNavigateToCardsViewToggled,
                               destination: { FlashCardsView.build(categoryTitle: viewModel.currentCategoryTitle,
                                                                   categoryId: viewModel.currentCategoryId) })
        .sheet(isPresented: $viewModel.isAddNewCardSheetShown) {
          addNewCategorySheet
        }
        
        .sheet(isPresented: $viewModel.isEditCardSheetShown) {
          editCategorySheet
        }
        .toolbarBackground(.white, for: .tabBar)
        .toolbarBackground(.visible, for: .tabBar)
        .toolbarColorScheme(.light, for: .tabBar)
      }
      .navigationTitle("Navigation Title")
      .toolbarBackground(
        Color.red,
        for: .navigationBar)
      .tabItem {
        Image(systemName: "house")
        Text("DashBoard")
      }
    }
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
                       saveCompletion: { title, id  in
      viewModel.saveButtonTrigger(title: title,
                                  id: id,
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

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView.build()
  }
}


