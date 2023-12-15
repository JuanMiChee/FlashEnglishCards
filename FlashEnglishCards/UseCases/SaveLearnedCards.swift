//
//  SaveLearnedCards.swift
//  FlashEnglishCards
//
//  Created by Juan Harrington on 14/12/23.
//

import Foundation

protocol SaveLearnedCardsUseCaseProtocol {
  func execute(cards: [FlashCardModel], cardCategoryTitle: String)
}

struct SaveLearnedCardsUseCase: SaveLearnedCardsUseCaseProtocol {
  let storage: MainStorage
  func execute(cards: [FlashCardModel], cardCategoryTitle: String) {
    storage.saveLearnedCards(cards: cards, cardCategoryTitle: cardCategoryTitle)
  }
}
