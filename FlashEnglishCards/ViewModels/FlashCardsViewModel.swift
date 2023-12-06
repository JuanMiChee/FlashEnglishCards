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
    
    let dependencies: Dependencies
    
    struct Dependencies {
        let getCards: GetCardUseCaseProtocol
        let saveCards: SaveNewCardUseCaseProtocol
    }
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    func addCardButtonTrigger() {
        isAddNewCardSheetShown = true
    }
    
    func saveNewCard(card: FlashCardModel) {
        dependencies.saveCards.execute(cardCategory: card)
    }
    
    func getCards() {
        viewContent.texts = dependencies.getCards.execute()
    }
}
