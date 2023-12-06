//
//  SaveNewCardUseCase.swift
//  FlashEnglishCards
//
//  Created by Juan Harrington on 6/12/23.
//

import Foundation

protocol SaveNewCardUseCaseProtocol {
    func execute(cardCategory: FlashCardModel)
}

struct SaveNewCardUseCase: SaveNewCardUseCaseProtocol {
    let storage: MainStorage
    func execute(cardCategory: FlashCardModel) {
        storage.saveNewCard(card: cardCategory)
    }
}
