//
//  FlashCardsViewModel.swift
//  FlashEnglishCards
//
//  Created by Juan Harrington on 5/12/23.
//

import Foundation

class FlashCardsViewModel: ObservableObject {
  
  @Published var viewContent: FlashCardsViewContent = .init(texts: [])
  var learnedCards: [FlashCardModel] = []
  
  @Published var isAddNewCardSheetShown: Bool = false
  
  var categoryTitle: String
  var currentBarProgress: Double
  var finalBarProgress: Double
  
  
  let dependencies: Dependencies
  
  struct Dependencies {
    let getCards: GetCardUseCaseProtocol
    let saveCard: SaveNewCardUseCaseProtocol
    let saveCards: SaveCurrentCardsUseCaseProtocol
    let saveLearnedCards: SaveLearnedCardsUseCaseProtocol
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
    if var firstIndex = viewContent.texts.last {
      
      if firstIndex.isLearned == false {
        firstIndex.seenDates.append(Date())
        viewContent.texts.insert(firstIndex, at: 0)
      }
      
      if firstIndex.seenDates.count >= 5 {
        firstIndex.isLearned = true
        learnedCards.append(firstIndex)
        viewContent.texts.removeLast()
      }
      
      viewContent.texts.removeLast()
      
      dependencies.saveCards.execute(cards: viewContent.texts.map({ cards in
        FlashCardModel(title: cards.title,
                       isFavorite: cards.isFavorite,
                       isLearned: cards.isLearned,
                       seenDates: cards.seenDates)
      }), cardCategoryTitle: categoryTitle)
      
      dependencies.saveLearnedCards.execute(cards: learnedCards,
                                            cardCategoryTitle: categoryTitle)
    }
  }
  
  func isCardLearnedTapped() {
    print(learnedCards)
    if var firstIndex = viewContent.texts.last {
      firstIndex.isLearned = true
      viewContent.texts.removeLast()
      learnedCards.append(firstIndex)
      dependencies.saveLearnedCards.execute(cards: learnedCards,
                                            cardCategoryTitle: categoryTitle)
    }
  }
}
