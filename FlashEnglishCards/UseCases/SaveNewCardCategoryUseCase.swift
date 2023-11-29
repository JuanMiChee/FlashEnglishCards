//
//  SaveCardsUseCase.swift
//  FlashEnglishCards
//
//  Created by Juan Harrington on 10/11/23.
//

import Foundation

protocol SaveNewCardCategoryUseCaseProtocol {
    func execute(card: FlashCardCategoryModel)
}

struct SaveNewCardCategoryUseCase: SaveNewCardCategoryUseCaseProtocol {
    let storage: MainStorage
    func execute(card: FlashCardCategoryModel) {
        storage.saveNewCardCategory(card: card)
    }
}
