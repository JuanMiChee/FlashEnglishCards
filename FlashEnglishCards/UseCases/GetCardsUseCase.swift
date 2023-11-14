//
//  GetCardsUseCase.swift
//  FlashEnglishCards
//
//  Created by Juan Harrington on 10/11/23.
//

import Foundation
protocol GetCardsUseCaseProtocol {
    func execute() -> [FlashCardModel]
}

struct GetCardsUseCase: GetCardsUseCaseProtocol {
    let storage: MainStorage
    
    func execute() -> [FlashCardModel]{
        storage.getCards()
    }
}
