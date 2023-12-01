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
    
    @Published var viewContent: HomeViewViewContent = HomeViewViewContent(texts: [FlashCardCategoryModel(text: "",
                                                                                                         numberOfCards: 0,
                                                                                                         numberOfCompletedCards: 0,
                                                                                                         progressBarColor: "red")])
    
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
    
    func saveButtonTrigger(title: String, numberofCards: Int, numberOfCompletedCards: Int) {
        isSheetPresented = false
        saveNewCard(card: FlashCardCategoryModel(text: title,
                                                 numberOfCards: numberofCards,
                                                 numberOfCompletedCards: numberOfCompletedCards,
                                                 progressBarColor: "red"))
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
