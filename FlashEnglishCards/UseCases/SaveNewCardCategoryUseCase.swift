//
//  SaveCardsUseCase.swift
//  FlashEnglishCards
//
//  Created by Juan Harrington on 10/11/23.
//

import Foundation

protocol SaveNewCardCategoryUseCaseProtocol {
    func execute(cardCategory: FlashCardCategoryModel)
}

struct SaveNewCardCategoryUseCase: SaveNewCardCategoryUseCaseProtocol {
    let storage: MainStorage
    func execute(cardCategory: FlashCardCategoryModel) {
        storage.saveNewCardCategory(card: cardCategory)
    }
}
