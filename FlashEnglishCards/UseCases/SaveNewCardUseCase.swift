//
//  SaveCardsUseCase.swift
//  FlashEnglishCards
//
//  Created by Juan Harrington on 10/11/23.
//

import Foundation

protocol SaveNewCardUseCaseProtocol {
    func execute(card: FlashCardModel)
}

struct SaveNewCardUseCase: SaveNewCardUseCaseProtocol {
    let storage: MainStorage
    func execute(card: FlashCardModel) {
        storage.saveNewCard(card: card)
    }
}
