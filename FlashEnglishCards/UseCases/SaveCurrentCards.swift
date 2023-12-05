//
//  SaveCurrentCards.swift
//  FlashEnglishCards
//
//  Created by Juan Harrington on 5/12/23.
//

import Foundation


protocol SaveCurrentCardsCategoryUseCaseProtocol {
    func execute(cards: [FlashCardCategoryModel])
}

struct SaveCurrentCardsCategoryUseCase: SaveCurrentCardsCategoryUseCaseProtocol {
    let storage: MainStorage
    func execute(cards: [FlashCardCategoryModel]) {
        storage.saveCurrentCardsCategory(cards: cards)
    }
}
