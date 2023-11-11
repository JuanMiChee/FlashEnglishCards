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
        return HomeView(viewModel: HomeViewViewModel(dependencies: HomeViewViewModel.Dependencies(getCards: GetCardsUseCase(storage: storage), saveCards: SaveNewCardUseCase(storage: storage))))
    }
}
