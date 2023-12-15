//
//  FlashCardViewBuilder.swift
//  FlashEnglishCards
//
//  Created by Juan Harrington on 5/12/23.
//

import Foundation

extension FlashCardsView {
  static func build(categoryTitle: String) -> Self {
    let storage = MainStorage()
    let getCardsUseCase = GetCardsUseCase(storage: storage)
    let saveCardsUseCase = SaveNewCardUseCase(storage: storage)
    let saveCurrentCardsUseCase = SaveCurrentCardsUseCase(storage: storage)
    let saveLearnedCardsUseCase = SaveLearnedCardsUseCase(storage: storage)
    
    return .init(addCardCompletion: {},
                 viewModel: FlashCardsViewModel(dependencies: .init(getCards: getCardsUseCase,
                                                                    saveCard: saveCardsUseCase,
                                                                    saveCards: saveCurrentCardsUseCase,
                                                                    saveLearnedCards: saveLearnedCardsUseCase),
                                                categoryTitle: categoryTitle,
                                                currentBarProgress: 0,
                                                finalBarProgress: 1))
  }
}
