//
//  HomeViewViewModel.swift
//  FlashEnglishCards
//
//  Created by Juan Harrington on 10/11/23.
//

import Foundation
import UIKit

class HomeViewViewModel: ObservableObject {
    
    @Published var isSheetPresented: Bool = false
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
        isSheetPresented = false
        saveNewCard(card: FlashCardModel(text: newCardTittle))
        asignCardsToView()
        newCardTittle = ""
    }
    
    func cancelButtonTrigger() {
        isSheetPresented = false
        newCardTittle = ""
    }
    
    func AddCardButtonTrigger() {
        isSheetPresented = true
    }
}
