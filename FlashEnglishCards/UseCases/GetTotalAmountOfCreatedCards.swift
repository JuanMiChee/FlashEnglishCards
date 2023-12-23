//
//  GetTotalAmountOfCreatedCards.swift
//  FlashEnglishCards
//
//  Created by Juan Harrington on 18/12/23.
//

import Foundation

protocol GetTotalAmountOfCreatedCardsProtocol {
  func execute(cardCategoryId: String) -> Double
}

struct GetTotalAmountOfCreatedCards: GetTotalAmountOfCreatedCardsProtocol {
  let storage: MainStorage
  
  func execute(cardCategoryId: String) -> Double {
    storage.getTotalAmountOfCreatedCards(cardsCategoryTitle: cardCategoryId)
  }
}
