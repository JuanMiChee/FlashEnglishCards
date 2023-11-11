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
    func execute() -> [FlashCardModel]{
        [FlashCardModel(text: "example 1"),
         FlashCardModel(text: "example 12"),
         FlashCardModel(text: "example 123"),
         FlashCardModel(text: "example 1234"),
         FlashCardModel(text: "example 12345")]
    }
}
