//
//  MainStorage.swift
//  FlashEnglishCards
//
//  Created by Juan Harrington on 10/11/23.
//

import Foundation

protocol StorageProtocol {
    func saveNewCardCategory(card: FlashCardCategoryModel)
    func getCardCateogries() -> [FlashCardCategoryModel]
}

struct MainStorage: StorageProtocol {
    let defaults = UserDefaults.standard
    
    func saveNewCardCategory(card: FlashCardCategoryModel) {
        var arrayToSave: [FlashCardCategoryModel] = getCardCateogries()
        arrayToSave.append(card)
        
        do {
            let encoder = JSONEncoder()
            if let encodedFlashCardArray = try? encoder.encode(arrayToSave) {
                defaults.set(encodedFlashCardArray, forKey: "flashCardCategories")
            }
        }
    }
    
    func getCardCateogries() -> [FlashCardCategoryModel] {
        var returnableCardsArray: [FlashCardCategoryModel] = []
        
        if let data = UserDefaults.standard.data(forKey: "flashCardCategories") {
            let decoder = JSONDecoder()
            
            if let decodedFlashCardArray = try? decoder.decode([FlashCardCategoryModel].self, from: data) {
                returnableCardsArray = decodedFlashCardArray
            }
        }
        return returnableCardsArray
    }
    
    func saveCurrentCardsCategory(cards: [FlashCardCategoryModel]) {
        do {
            let encoder = JSONEncoder()
            if let encodedFlashCardArray = try? encoder.encode(cards) {
                defaults.set(encodedFlashCardArray, forKey: "flashCardCategories")
            }
        }
    }
    
    func saveNewCard(card: FlashCardModel) {
        var arrayToSave: [FlashCardModel] = getCards()
        arrayToSave.append(card)
        
        do {
            let encoder = JSONEncoder()
            if let encodedFlashCardArray = try? encoder.encode(arrayToSave) {
                defaults.set(encodedFlashCardArray, forKey: "flashCards")
            }
        }
    }
    
    func getCards() -> [FlashCardModel]{
        var returnableCardsArray: [FlashCardModel] = []
        
        if let data = UserDefaults.standard.data(forKey: "flashCards") {
            let decoder = JSONDecoder()
            
            if let decodedFlashCardArray = try? decoder.decode([FlashCardModel].self, from: data) {
                returnableCardsArray = decodedFlashCardArray
            }
        }
        return returnableCardsArray
    }
}
