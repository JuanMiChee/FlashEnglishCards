//
//  GetCardsUseCase.swift
//  FlashEnglishCards
//
//  Created by Juan Harrington on 6/12/23.
//

import Foundation

protocol GetCardUseCaseProtocol {
  func execute(cardCategoryId: String) -> [FlashCardModel]
}

struct GetCardsUseCase: GetCardUseCaseProtocol {
  let storage: MainStorage
  
  func execute(cardCategoryId: String) -> [FlashCardModel]{
    storage.getCards(cardsCategoryTitle: cardCategoryId)
  }
}
