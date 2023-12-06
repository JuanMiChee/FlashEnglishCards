//
//  FlashCardViewBuilder.swift
//  FlashEnglishCards
//
//  Created by Juan Harrington on 5/12/23.
//

import Foundation

@available(iOS 16.0, *)
extension FlashCardsView {
    static func build(categoryTitle: String) -> Self {
        let storage = MainStorage()
        let getCardsUseCase = GetCardsUseCase(storage: storage)
        let saveCardsUseCase = SaveNewCardUseCase(storage: storage)
        
        return .init(categoryTitle: "",
                     currentBarProgress: 0,
                     finalBarProgress: 1,
                     addCardCompletion: {},
                     viewModel: FlashCardsViewModel(dependencies: .init(getCards: getCardsUseCase, saveCards: saveCardsUseCase)))
    }
}
