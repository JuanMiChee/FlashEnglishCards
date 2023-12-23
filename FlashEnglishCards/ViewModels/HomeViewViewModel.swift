//
//  HomeViewViewModel.swift
//  FlashEnglishCards
//
//  Created by Juan Harrington on 10/11/23.
//

import Foundation
import UIKit

class HomeViewViewModel: ObservableObject {
  
  @Published var isAddNewCardSheetShown: Bool = false
  @Published var isEditCardSheetShown: Bool = false
  
  @Published var newCardCategoryTittle: String = ""
  @Published var moreInfoText: String = ""
  @Published var isNavigateToCardsViewToggled: Bool = false
  
  var currentCardIndex: Int = 0
  
  @Published var viewContent: HomeViewViewContent = HomeViewViewContent(flashCardCategories: [FlashCardCategoryModel(text: "",
                                                                                                                     flashCards: [],
                                                                                                                     numberOfCompletedCards: 0,
                                                                                                                     progressBarColor: "red",
                                                                                                                     id: UUID().uuidString)])
  
  let dependencies: Dependencies
  
  var currentCategoryTitle: String = ""
  var currentCategoryId: String
  
  struct Dependencies {
    let getCardCategories: GetCardCategoriesUseCaseProtocol
    let saveCardsCategories: SaveNewCardCategoryUseCaseProtocol
    let saveCurrentCards: SaveCurrentCardCategoriesUseCaseProtocol
    let getCards: GetCardUseCaseProtocol
    let getLearnedCards: GetLeanedCardsUseCaseProtocol
    let getTotalAmountOfCards: GetTotalAmountOfCreatedCards
  }
  
  init(dependencies: Dependencies, id: String) {
    self.dependencies = dependencies
    self.currentCategoryId = id
  }
  
  
  func asignCardsToView() {
    viewContent.flashCardCategories = dependencies.getCardCategories.execute()
  }
  
  private func saveNewCardCategory(cardCategory: FlashCardCategoryModel) {
    dependencies.saveCardsCategories.execute(cardCategory: cardCategory)
  }
  
  func saveCurrentCards() {
    dependencies.saveCurrentCards.execute(cards: viewContent.flashCardCategories.map({ card in
      FlashCardCategoryModel(text: card.text,
                             flashCards: dependencies.getCards.execute(cardCategoryId: card.id),
                             numberOfCompletedCards: 0,
                             progressBarColor: "red",
                             id: card.id)
    }))
  }
  
  func saveButtonTrigger(title: String, id: String, numberOfCompletedCards: Int) {
    isAddNewCardSheetShown = false
    saveNewCardCategory(cardCategory: FlashCardCategoryModel(text: title,
                                                             flashCards: [],
                                                             numberOfCompletedCards: numberOfCompletedCards,
                                                             progressBarColor: "red",
                                                             id: id))
    asignCardsToView()
    newCardCategoryTittle = ""
  }
  
  func cancelButtonTrigger() {
    isAddNewCardSheetShown = false
    isEditCardSheetShown = false
    newCardCategoryTittle = ""
  }
  
  func AddCardCategoryButtonTrigger() {
    isAddNewCardSheetShown = true
  }
  
  func edditCardCategoryTrigger() {
    isEditCardSheetShown = true
  }
  
  func handleViewAppeared() {
    asignCardsToView()
    saveCurrentCards()
    asignCardsToView()
  }
  
  func navigateToCardsView() {
    isNavigateToCardsViewToggled = true
  }
  
  func categoryDeleteClosureTrigger(index: Int) {
    viewContent.flashCardCategories.remove(at: index)
    saveCurrentCards()
  }
  
  func buildFlashCardView(category: FlashCardCategoryModel) -> FlashCardCategoryView {
    FlashCardCategoryView(title: category.text,
                          progresBarCurrentProgress: dependencies.getLearnedCards.execute(cardCategoryId: category.id).count,
                          progressBarFinishProgress: Int(dependencies.getTotalAmountOfCards.execute(cardCategoryId: category.id)),
                          categoryEditClosure: { if let index = self.viewContent.flashCardCategories.firstIndex(of: category) {
                            self.currentCardIndex = index
                            self.isEditCardSheetShown = true}},
                          caregoryDeleteClosure: { if let index = self.viewContent.flashCardCategories.firstIndex(of: category) {
                            self.viewContent.flashCardCategories.remove(at: index)}
      self.saveCurrentCards()})
  }
  
  func aCategoryGetsTapped(category: FlashCardCategoryModel) {
    if let index = viewContent.flashCardCategories.firstIndex(of: category) {
      currentCategoryTitle = viewContent.flashCardCategories[index].text
      currentCategoryId = viewContent.flashCardCategories[index].id
    }
    navigateToCardsView()
  }
}
