//
//  SaveTotalAmountOfCreatedCards.swift
//  FlashEnglishCards
//
//  Created by Juan Harrington on 18/12/23.
//

import Foundation

protocol SaveTotalAmountOfCreatedCardsProtocol {
  func execute(totalAmount: Double, cardCategoryId: String)
}

struct SaveTotalAmountOfCreatedCards: SaveTotalAmountOfCreatedCardsProtocol {
  let storage: MainStorage
  func execute(totalAmount: Double, cardCategoryId: String) {
    storage.saveTotalAmountOfCreatedCards(cardsCategoryTitle: cardCategoryId, totalAmountOfCards: totalAmount)
  }
}
