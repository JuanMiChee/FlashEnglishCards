//
//  FlashCardViewBuilder.swift
//  FlashEnglishCards
//
//  Created by Juan Harrington on 5/12/23.
//

import Foundation

extension FlashCardsView {
  static func build(categoryTitle: String, categoryId: String) -> Self {
    let storage = MainStorage()
    let getCardsUseCase = GetCardsUseCase(storage: storage)
    let saveCardsUseCase = SaveNewCardUseCase(storage: storage)
    let saveCurrentCardsUseCase = SaveCurrentCardsUseCase(storage: storage)
    let saveLearnedCardsUseCase = SaveLearnedCardsUseCase(storage: storage)
    let saveTotalAmoutOfCards = SaveTotalAmountOfCreatedCards(storage: storage)
    let getTotalAmoutOfCards = GetTotalAmountOfCreatedCards(storage: storage)
    let getLearnedCards = GetLeanedCardsUseCase(storage: storage)
    
    return .init(addCardCompletion: {},
                 viewModel: FlashCardsViewModel(dependencies: .init(getCards: getCardsUseCase,
                                                                    saveCard: saveCardsUseCase,
                                                                    saveCards: saveCurrentCardsUseCase,
                                                                    saveLearnedCards: saveLearnedCardsUseCase,
                                                                    getLearnedCards: getLearnedCards,
                                                                    saveTotalAmoutOfCards: saveTotalAmoutOfCards,
                                                                    getTotalAmountOfCards: getTotalAmoutOfCards),
                                                categoryTitle: categoryTitle,
                                                currentBarProgress: 0,
                                                finalBarProgress: 1,
                                                categoryId: categoryId))
  }
}
