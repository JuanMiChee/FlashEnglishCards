//
//  SaveCurrentCards.swift
//  FlashEnglishCards
//
//  Created by Juan Harrington on 5/12/23.
//

import Foundation


protocol SaveCurrentCardCategoriesUseCaseProtocol {
  func execute(cards: [FlashCardCategoryModel])
}

struct SaveCurrentCardCategoriesUseCase: SaveCurrentCardCategoriesUseCaseProtocol {
  let storage: MainStorage
  func execute(cards: [FlashCardCategoryModel]) {
    storage.saveCurrentCardsCategory(cards: cards)
  }
}
