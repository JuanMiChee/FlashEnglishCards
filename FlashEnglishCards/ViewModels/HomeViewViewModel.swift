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
    @Published var navigateToCardsView: Bool = false
    
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
    
    func saveButtonTrigger(title: String, numberofCards: Int, numberOfCompletedCards: Int) {
        isSheetPresented = false
        saveNewCardCategory(cardCategory: FlashCardCategoryModel(text: title,
                                                 flashCards: [],
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
