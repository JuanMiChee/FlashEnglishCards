//
//  SaveCardsUseCase.swift
//  FlashEnglishCards
//
//  Created by Juan Harrington on 10/11/23.
//

import Foundation

protocol SaveCardsUseCaseProtocol {
    func execute()
}

struct SaveCardsUseCase: SaveCardsUseCaseProtocol {
    func execute() {
        print("Remember to implement save cards use case stupid")
    }
}
