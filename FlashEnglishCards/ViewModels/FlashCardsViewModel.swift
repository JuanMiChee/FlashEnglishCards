//
//  FlashCardsViewModel.swift
//  FlashEnglishCards
//
//  Created by Juan Harrington on 5/12/23.
//

import Foundation

class FlashCardsViewModel: ObservableObject {
    
    @Published var viewContent: FlashCardsViewContent = .init(texts: [])
    
    @Published var isAddNewCardSheetShown: Bool = false
    
    var categoryTitle: String
    var currentBarProgress: Double
    var finalBarProgress: Double
    
    
    let dependencies: Dependencies
    
    struct Dependencies {
        let getCards: GetCardUseCaseProtocol
        let saveCards: SaveNewCardUseCaseProtocol
    }
    
    init(dependencies: Dependencies, categoryTitle: String, currentBarProgress: Double, finalBarProgress: Double) {
        self.dependencies = dependencies
        self.categoryTitle = categoryTitle
        self.currentBarProgress = currentBarProgress
        self.finalBarProgress = finalBarProgress
    }
    
    func addCardButtonTrigger() {
        isAddNewCardSheetShown = true
    }
    
    func saveNewCard(card: FlashCardModel) {
        dependencies.saveCards.execute(cardCategory: card, cardCategoryTitle: categoryTitle)
    }
    
    func getCards() {
        viewContent.texts = dependencies.getCards.execute(cardsCategoryTitle: categoryTitle)
    }
}
