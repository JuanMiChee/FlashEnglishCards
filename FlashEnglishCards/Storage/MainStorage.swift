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
                defaults.set(encodedFlashCardArray, forKey: "flashCardCategoriesArray")
            }
        }
    }
    
    func getCardCateogries() -> [FlashCardCategoryModel] {
        var returnableCardsArray: [FlashCardCategoryModel] = []
        
        if let data = UserDefaults.standard.data(forKey: "flashCardCategoriesArray") {
            let decoder = JSONDecoder()
            
            if let decodedFlashCardArray = try? decoder.decode([FlashCardCategoryModel].self, from: data) {
                returnableCardsArray = decodedFlashCardArray
            }
        }
        return returnableCardsArray
    }
}
