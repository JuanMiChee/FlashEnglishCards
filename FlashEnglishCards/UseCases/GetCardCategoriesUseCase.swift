//
//  GetCardsUseCase.swift
//  FlashEnglishCards
//
//  Created by Juan Harrington on 10/11/23.
//

import Foundation
protocol GetCardCategoriesUseCaseProtocol {
  func execute() -> [FlashCardCategoryModel]
}

struct GetCardCategoriesUseCase: GetCardCategoriesUseCaseProtocol {
  let storage: MainStorage
  
  func execute() -> [FlashCardCategoryModel]{
    storage.getCardCateogries()
  }
}
