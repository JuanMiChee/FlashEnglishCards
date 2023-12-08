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
    @Published var isNavigateToCardsViewToggled: Bool = false
    
    var currentCardIndex: Int = 0
    
    @Published var viewContent: HomeViewViewContent = HomeViewViewContent(flashCardCategories: [FlashCardCategoryModel(text: "",
                                                                                                         flashCards: [],
                                                                                                         numberOfCompletedCards: 0,
                                                                                                         progressBarColor: "red")])
    
    let dependencies: Dependencies
    
    var currentCategoryTitle: String = ""
    
    struct Dependencies {
        let getCardCategories: GetCardCategoriesUseCaseProtocol
        let saveCardsCategories: SaveNewCardCategoryUseCaseProtocol
        let saveCurrentCards: SaveCurrentCardCategoriesUseCaseProtocol
        let getCards: GetCardsUseCase
    }
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    
    func asignCardsToView() {
        viewContent.flashCardCategories = dependencies.getCardCategories.execute()
    }
    
    private func saveNewCardCategory(cardCategory: FlashCardCategoryModel) {
        dependencies.saveCardsCategories.execute(cardCategory: cardCategory)
    }
    
    func saveCurrentCards() {
        dependencies.saveCurrentCards.execute(cards: viewContent.flashCardCategories.map({ card in
            FlashCardCategoryModel(text: card.text,
                                   flashCards: dependencies.getCards.execute(cardsCategoryTitle: card.text),
                                   numberOfCompletedCards: 0,
                                   progressBarColor: "red")
        }))
    }
    
    func saveButtonTrigger(title: String, numberOfCompletedCards: Int) {
        isAddNewCardSheetShown = false
        saveNewCardCategory(cardCategory: FlashCardCategoryModel(text: title,
                                                 flashCards: [],
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
    
    func handleViewAppeared() {
        asignCardsToView()
        saveCurrentCards()
        asignCardsToView()
    }
    
    func navigateToCardsView() {
        isNavigateToCardsViewToggled = true
    }
    
    func categoryDeleteClosureTrigger(index: Int) {
        viewContent.flashCardCategories.remove(at: index)
        saveCurrentCards()
    }
    
    @available(iOS 15.0, *)
    func buildFlashCardView(category: FlashCardCategoryModel) -> FlashCardCategoryView {
        FlashCardCategoryView(title: category.text,
                             progresBarCurrentProgress: category.numberOfCompletedCards,
                              progressBarFinishProgress: category.flashCards.count,
                              categoryEditClosure: { if let index = self.viewContent.flashCardCategories.firstIndex(of: category) {
                                  self.currentCardIndex = index
                                  self.isEditCardSheetShown = true}},
                              caregoryDeleteClosure: { if let index = self.viewContent.flashCardCategories.firstIndex(of: category) {
                                  self.viewContent.flashCardCategories.remove(at: index)}
                                  self.saveCurrentCards()})
    }
    
    func aCategoryGetsTapped(category: FlashCardCategoryModel) {
        if let index = viewContent.flashCardCategories.firstIndex(of: category) {
            currentCategoryTitle = viewContent.flashCardCategories[index].text
        }
        navigateToCardsView()
    }
}
