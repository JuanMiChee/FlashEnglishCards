//
//  HomeViewViewModel.swift
//  FlashEnglishCards
//
//  Created by Juan Harrington on 10/11/23.
//

import Foundation
import UIKit

class HomeViewViewModel: ObservableObject {
    
    @Published var isAddNewCardSheetToggled: Bool = false
    @Published var isCardMoreInfoViewToggled: Bool = false
    @Published var newCardTittle: String = ""
    @Published var moreInfoText: String = ""
    
    @Published var viewContent: HomeViewViewContent = HomeViewViewContent(texts: [FlashCardModel(text: "")])
    
    let dependencies: Dependencies
    
    struct Dependencies {
        let getCards: GetCardsUseCaseProtocol
        let saveCards: SaveNewCardUseCaseProtocol
    }
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    
    func asignCardsToView() {
        viewContent.texts = dependencies.getCards.execute()
    }
    
    private func saveNewCard(card: FlashCardModel) {
        dependencies.saveCards.execute(card: card)
    }
    
    func doneButtonTrigger() {
        isAddNewCardSheetToggled = false
        saveNewCard(card: FlashCardModel(text: newCardTittle))
        asignCardsToView()
        newCardTittle = ""
    }
    
    func cancelButtonTrigger() {
        isAddNewCardSheetToggled = false
        newCardTittle = ""
    }
    
    func AddCardButtonTrigger() {
        isAddNewCardSheetToggled = true
    }
}
