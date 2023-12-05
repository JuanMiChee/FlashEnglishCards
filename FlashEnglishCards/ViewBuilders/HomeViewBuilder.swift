//
//  HomeViewBuilder.swift
//  FlashEnglishCards
//
//  Created by Juan Harrington on 10/11/23.
//

import Foundation

@available(iOS 16.0, *)
extension HomeView {
    static func build() -> Self {
        let storage = MainStorage()
        let getCardsUseCase = GetCardCategoriesUseCase(storage: storage)
        let saveCardsUseCase = SaveNewCardCategoryUseCase(storage: storage)
        let saveCurrentCardsUseCase = SaveCurrentCardsCategoryUseCase(storage: storage)
        
        return .init(viewModel: .init(dependencies: .init(getCards: getCardsUseCase,
                                                          saveCards: saveCardsUseCase,
                                                          saveCurrentCards: saveCurrentCardsUseCase)))
    }
}
