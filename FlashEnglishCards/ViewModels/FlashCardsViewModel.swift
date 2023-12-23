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
  var categoryId: String
  @Published var finalBarProgress: Double
  @Published var currentCardsTotal: Double = 1
  
  let dependencies: Dependencies
  
  struct Dependencies {
    let getCards: GetCardUseCaseProtocol
    let saveCard: SaveNewCardUseCaseProtocol
    let saveCards: SaveCurrentCardsUseCaseProtocol
    let saveLearnedCards: SaveLearnedCardsUseCaseProtocol
    let getLearnedCards: GetLeanedCardsUseCaseProtocol
    let saveTotalAmoutOfCards: SaveTotalAmountOfCreatedCardsProtocol
    let getTotalAmountOfCards: GetTotalAmountOfCreatedCardsProtocol
  }
  
  init(dependencies: Dependencies, categoryTitle: String, currentBarProgress: Double, finalBarProgress: Double, categoryId: String) {
    self.dependencies = dependencies
    self.categoryTitle = categoryTitle
    self.currentBarProgress = currentBarProgress
    self.finalBarProgress = finalBarProgress
    self.categoryId = categoryId
  }
  
  func addCardButtonTrigger() {
    isAddNewCardSheetShown = true
  }
  
  func saveNewCard(card: FlashCardModel) {
    dependencies.saveCard.execute(cardCategory: card, cardCategoryId: categoryId)
  }
  
  func viewAppeared() {
    currentBarProgress = Double(dependencies.getLearnedCards.execute(cardCategoryId: categoryId).count)
    learnedCards = dependencies.getLearnedCards.execute(cardCategoryId: categoryId)
    if dependencies.getTotalAmountOfCards.execute(cardCategoryId: categoryId) < 1 {
      finalBarProgress = 1
    } else {
      finalBarProgress = dependencies.getTotalAmountOfCards.execute(cardCategoryId: categoryId)
    }
  }
  
  func getCards() {
    viewContent.texts = dependencies.getCards.execute(cardCategoryId: categoryId)
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
        finalBarProgress = Double(dependencies.getLearnedCards.execute(cardCategoryId: categoryId).count)
      }
      
      viewContent.texts.removeLast()
      
      dependencies.saveCards.execute(cards: viewContent.texts,cardCategoryId: categoryId)
      learnedCards = dependencies.getLearnedCards.execute(cardCategoryId: categoryId)
      dependencies.saveLearnedCards.execute(cards: learnedCards,
                                            cardCategoryId: categoryId)
      dependencies.saveTotalAmoutOfCards.execute(totalAmount: currentCardsTotal, cardCategoryId: categoryId)
    }
  }
  
  func isCardLearnedTapped() {
    if var firstIndex = viewContent.texts.last {
      learnedCards = dependencies.getLearnedCards.execute(cardCategoryId: categoryId)
      firstIndex.isLearned = true
      viewContent.texts.removeLast()
      learnedCards.append(firstIndex)
      dependencies.saveCards.execute(cards: viewContent.texts, cardCategoryId: categoryId)
      dependencies.saveLearnedCards.execute(cards: learnedCards,
                                            cardCategoryId: categoryId)
      currentBarProgress = Double(dependencies.getLearnedCards.execute(cardCategoryId: categoryId).count)
      finalBarProgress = dependencies.getTotalAmountOfCards.execute(cardCategoryId: categoryId)
    }
  }
  
  func onDisappearView() {
    dependencies.saveCards.execute(cards: viewContent.texts,
                                   cardCategoryId: categoryId)
    dependencies.saveLearnedCards.execute(cards: learnedCards,
                                          cardCategoryId: categoryId)
  }
  
  func getCurrentAmountOfCards() {
    currentCardsTotal = dependencies.getTotalAmountOfCards.execute(cardCategoryId: categoryId)
  }
  
  func saveAmountOfCreatedCards() {
    currentCardsTotal = currentCardsTotal + 1
    finalBarProgress = currentCardsTotal
    dependencies.saveTotalAmoutOfCards.execute(totalAmount: currentCardsTotal, cardCategoryId: categoryId)
    finalBarProgress = Double(dependencies.getTotalAmountOfCards.execute(cardCategoryId: categoryId))
  }
}
