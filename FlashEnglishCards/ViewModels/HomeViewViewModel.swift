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
    @Published var newCardCategoryTittle: String = ""
    @Published var moreInfoText: String = ""
    
    @Published var viewContent: HomeViewViewContent = HomeViewViewContent(texts: [FlashCardCategoryModel(text: "")])
    
    let dependencies: Dependencies
    
    struct Dependencies {
        let getCards: GetCardCategoriesUseCaseProtocol
        let saveCards: SaveNewCardCategoryUseCaseProtocol
    }
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    
    func asignCardsToView() {
        viewContent.texts = dependencies.getCards.execute()
    }
    
    private func saveNewCard(card: FlashCardCategoryModel) {
        dependencies.saveCards.execute(card: card)
    }
    
    func saveButtonTrigger(title: String) {
        isSheetPresented = false
        saveNewCard(card: FlashCardCategoryModel(text: title))
        asignCardsToView()
        newCardCategoryTittle = ""
    }
    
    func cancelButtonTrigger() {
        isSheetPresented = false
        newCardCategoryTittle = ""
    }
    
    func AddCardButtonTrigger() {
        isSheetPresented = true
    }
}
