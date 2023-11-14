//
//  HomeViewBuilder.swift
//  FlashEnglishCards
//
//  Created by Juan Harrington on 10/11/23.
//

import Foundation

extension HomeView {
    static func build() -> Self {
        let storage = MainStorage()
        let getCardsUseCase = GetCardsUseCase(storage: storage)
        let saveCardsUseCase = SaveNewCardUseCase(storage: storage)
        
        return .init(viewModel: .init(dependencies: .init(getCards: getCardsUseCase,
                                                          saveCards: saveCardsUseCase)))
    }
}
