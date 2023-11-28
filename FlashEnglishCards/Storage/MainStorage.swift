//
//  MainStorage.swift
//  FlashEnglishCards
//
//  Created by Juan Harrington on 10/11/23.
//

import Foundation

protocol StorageProtocol {
    func saveNewCard(card: FlashCardModel)
    func getCards() -> [FlashCardModel]
}

struct MainStorage: StorageProtocol {
    let defaults = UserDefaults.standard
    
    func saveNewCard(card: FlashCardModel) {
        var arrayToSave: [FlashCardModel] = getCards()
        arrayToSave.append(card)
        
        do {
            let encoder = JSONEncoder()
            if let encodedFlashCardArray = try? encoder.encode(arrayToSave) {
                //print(encodedFlashCardArray)
                defaults.set(encodedFlashCardArray, forKey: "flashCardsArray")
            }
        }
    }
    
    func getCards() -> [FlashCardModel] {
        var returnableCardsArray: [FlashCardModel] = []
        
        if let data = UserDefaults.standard.data(forKey: "flashCardsArray") {
            let decoder = JSONDecoder()
            
            if let decodedFlashCardArray = try? decoder.decode([FlashCardModel].self, from: data) {
                returnableCardsArray = decodedFlashCardArray
            }
        }
        //print(returnableCardsArray)
        return returnableCardsArray
    }
}
