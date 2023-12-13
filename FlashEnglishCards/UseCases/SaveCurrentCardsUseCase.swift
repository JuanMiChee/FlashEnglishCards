//
//  SaveCurrentCardsUseCase.swift
//  FlashEnglishCards
//
//  Created by Juan Harrington on 13/12/23.
//

import Foundation

protocol SaveCurrentCardsUseCaseProtocol {
  func execute(cards: [FlashCardModel], cardCategoryTitle: String)
}

struct SaveCurrentCardsUseCase: SaveCurrentCardsUseCaseProtocol {
  let storage: MainStorage
  func execute(cards: [FlashCardModel], cardCategoryTitle: String) {
    storage.saveCurrentCards(cards: cards, cardCategoryTitle: cardCategoryTitle)
  }
}
