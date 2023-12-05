//
//  HomeViewViewModel.swift
//  FlashEnglishCards
//
//  Created by Juan Harrington on 10/11/23.
//

import Foundation
import UIKit

class HomeViewViewModel: ObservableObject {
    
    @Published var isAddNewCardSheetShown: Bool = false
    @Published var isEditCardSheetShown: Bool = false
    
    @Published var newCardCategoryTittle: String = ""
    @Published var moreInfoText: String = ""
    @Published var navigateToCardsView: Bool = false
    
    var currentCardIndex: Int = 0
    
    @Published var viewContent: HomeViewViewContent = HomeViewViewContent(texts: [FlashCardCategoryModel(text: "",
                                                                                                         flashCards: [],
                                                                                                         numberOfCards: 0,
                                                                                                         numberOfCompletedCards: 0,
                                                                                                         progressBarColor: "red")])
    
    let dependencies: Dependencies
    
    var currentCategoryTitle: String = ""
    
    struct Dependencies {
        let getCards: GetCardCategoriesUseCaseProtocol
        let saveCards: SaveNewCardCategoryUseCaseProtocol
        let saveCurrentCards: SaveCurrentCardsCategoryUseCaseProtocol
    }
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    
    func asignCardsToView() {
        viewContent.texts = dependencies.getCards.execute()
    }
    
    private func saveNewCardCategory(cardCategory: FlashCardCategoryModel) {
        dependencies.saveCards.execute(cardCategory: cardCategory)
    }
    
    func saveCurrentCards() {
        dependencies.saveCurrentCards.execute(cards: viewContent.texts.map({ card in
            FlashCardCategoryModel(text: card.text,
                                   flashCards: [],
                                   numberOfCards: 0,
                                   numberOfCompletedCards: 0,
                                   progressBarColor: "red")
        }))
    }
    
    func saveButtonTrigger(title: String, numberofCards: Int, numberOfCompletedCards: Int) {
        isAddNewCardSheetShown = false
        saveNewCardCategory(cardCategory: FlashCardCategoryModel(text: title,
                                                 flashCards: [],
                                                 numberOfCards: numberofCards,
                                                 numberOfCompletedCards: numberOfCompletedCards,
                                                 progressBarColor: "red"))
        asignCardsToView()
        newCardCategoryTittle = ""
    }
    
    func cancelButtonTrigger() {
        isAddNewCardSheetShown = false
        isEditCardSheetShown = false
        newCardCategoryTittle = ""
    }
    
    func AddCardCategoryButtonTrigger() {
        isAddNewCardSheetShown = true
    }
    
    func edditCardCategoryTrigger() {
        isEditCardSheetShown = true
    }
}
