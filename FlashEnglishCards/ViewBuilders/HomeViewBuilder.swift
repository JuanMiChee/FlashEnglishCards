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
        let getCardCategoriesUseCase = GetCardCategoriesUseCase(storage: storage)
        let saveCardCategoriesUseCase = SaveNewCardCategoryUseCase(storage: storage)
        let saveCurrentCardCategoriesUseCase = SaveCurrentCardCategoriesUseCase(storage: storage)
        let getCardsUseCase = GetCardsUseCase(storage: storage)
        
        return .init(viewModel: .init(dependencies: .init(getCardCategories: getCardCategoriesUseCase,
                                                          saveCardsCategories: saveCardCategoriesUseCase,
                                                          saveCurrentCards: saveCurrentCardCategoriesUseCase,
                                                          getCards: getCardsUseCase)))
    }
}
