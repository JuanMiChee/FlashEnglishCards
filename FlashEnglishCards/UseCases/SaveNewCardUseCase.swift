//
//  SaveNewCardUseCase.swift
//  FlashEnglishCards
//
//  Created by Juan Harrington on 6/12/23.
//

import Foundation

protocol SaveNewCardUseCaseProtocol {
  func execute(cardCategory: FlashCardModel, cardCategoryTitle: String)
}

struct SaveNewCardUseCase: SaveNewCardUseCaseProtocol {
  let storage: MainStorage
  func execute(cardCategory: FlashCardModel, cardCategoryTitle: String) {
    storage.saveNewCard(card: cardCategory, cardCategoryTitle: cardCategoryTitle)
  }
}
