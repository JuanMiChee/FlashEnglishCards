//
//  SaveNewCardUseCase.swift
//  FlashEnglishCards
//
//  Created by Juan Harrington on 6/12/23.
//

import Foundation

protocol SaveNewCardUseCaseProtocol {
  func execute(cardCategory: FlashCardModel, cardCategoryId: String)
}

struct SaveNewCardUseCase: SaveNewCardUseCaseProtocol {
  let storage: MainStorage
  func execute(cardCategory: FlashCardModel, cardCategoryId: String) {
    storage.saveNewCard(card: cardCategory, cardCategoryTitle: cardCategoryId)
  }
}
