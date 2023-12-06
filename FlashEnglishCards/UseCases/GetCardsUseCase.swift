//
//  GetCardsUseCase.swift
//  FlashEnglishCards
//
//  Created by Juan Harrington on 6/12/23.
//

import Foundation

protocol GetCardUseCaseProtocol {
    func execute() -> [FlashCardModel]
}

struct GetCardsUseCase: GetCardUseCaseProtocol {
    let storage: MainStorage
    
    func execute() -> [FlashCardModel]{
        storage.getCards()
    }
}
