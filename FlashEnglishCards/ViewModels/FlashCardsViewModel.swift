//
//  FlashCardsViewModel.swift
//  FlashEnglishCards
//
//  Created by Juan Harrington on 5/12/23.
//

import Foundation

class FlashCardsViewModel: ObservableObject {
  
  @Published var viewContent: FlashCardsViewContent = .init(texts: [])
  
  @Published var isAddNewCardSheetShown: Bool = false
  
  var categoryTitle: String
  var currentBarProgress: Double
  var finalBarProgress: Double
  
  
  let dependencies: Dependencies
  
  struct Dependencies {
    let getCards: GetCardUseCaseProtocol
    let saveCard: SaveNewCardUseCaseProtocol
    let saveCards: SaveCurrentCardsUseCaseProtocol
  }
  
  init(dependencies: Dependencies, categoryTitle: String, currentBarProgress: Double, finalBarProgress: Double) {
    self.dependencies = dependencies
    self.categoryTitle = categoryTitle
    self.currentBarProgress = currentBarProgress
    self.finalBarProgress = finalBarProgress
  }
  
  func addCardButtonTrigger() {
    isAddNewCardSheetShown = true
  }
  
  func saveNewCard(card: FlashCardModel) {
    dependencies.saveCard.execute(cardCategory: card, cardCategoryTitle: categoryTitle)
  }
  
  func saveCardChanges() {
    
  }
  
  func getCards() {
    viewContent.texts = dependencies.getCards.execute(cardsCategoryTitle: categoryTitle)
  }
  
  func addPlusOneToSeenCount() {
    if var firstIndex = viewContent.texts.first {
      firstIndex.seenCount = firstIndex.seenCount + 1
      viewContent.texts.remove(at: 0)
      viewContent.texts.append(firstIndex)
      dependencies.saveCards.execute(cards: viewContent.texts.map({ cards in
        FlashCardModel(title: cards.title,
                       isFavorite: cards.isFavorite,
                       seenCount: cards.seenCount,
                       isLearned: cards.isLearned)
      }), cardCategoryTitle: categoryTitle)
    }
  }
  
  func isCardLearnedTapped() {
    if var firstIndex = viewContent.texts.first {
      viewContent.texts.remove(at: 0)
    }
  }
}
