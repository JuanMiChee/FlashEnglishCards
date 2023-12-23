//
//  GetLearnedCards.swift
//  FlashEnglishCards
//
//  Created by Juan Harrington on 18/12/23.
//

import Foundation

protocol GetLeanedCardsUseCaseProtocol {
  func execute(cardCategoryId: String) -> [FlashCardModel]
}

struct GetLeanedCardsUseCase: GetLeanedCardsUseCaseProtocol {
  let storage: MainStorage
  
  func execute(cardCategoryId: String) -> [FlashCardModel]{
    storage.getLearnedCards(cardsCategoryTitle: cardCategoryId)
  }
}
