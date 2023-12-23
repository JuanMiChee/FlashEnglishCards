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
  
  func saveCurrentCards(cards: [FlashCardModel], cardCategoryTitle: String) {
    do {
      let encoder = JSONEncoder()
      if let encodedFlashCardArray = try? encoder.encode(cards) {
        defaults.set(encodedFlashCardArray, forKey: cardCategoryTitle)
      }
    }
  }
  
  func saveNewCard(card: FlashCardModel, cardCategoryTitle: String) {
    var arrayToSave: [FlashCardModel] = getCards(cardsCategoryTitle: cardCategoryTitle)
    arrayToSave.append(card)
    
    do {
      let encoder = JSONEncoder()
      if let encodedFlashCardArray = try? encoder.encode(arrayToSave) {
        defaults.set(encodedFlashCardArray, forKey: cardCategoryTitle)
      }
    }
  }
  
  func getCards(cardsCategoryTitle: String) -> [FlashCardModel]{
    var returnableCardsArray: [FlashCardModel] = []
    
    if let data = UserDefaults.standard.data(forKey: cardsCategoryTitle) {
      let decoder = JSONDecoder()
      
      if let decodedFlashCardArray = try? decoder.decode([FlashCardModel].self, from: data) {
        returnableCardsArray = decodedFlashCardArray
      }
    }
    return returnableCardsArray
  }
  
  func saveLearnedCards(cards: [FlashCardModel], cardCategoryTitle: String) {
    do {
      let encoder = JSONEncoder()
      if let encodedFlashCardArray = try? encoder.encode(cards) {
        defaults.set(encodedFlashCardArray, forKey: "learned\(cardCategoryTitle)")
      }
    }
  }
  
  func getLearnedCards(cardsCategoryTitle: String) -> [FlashCardModel]{
    var returnableCardsArray: [FlashCardModel] = []
    
    if let data = UserDefaults.standard.data(forKey: "learned\(cardsCategoryTitle)") {
      let decoder = JSONDecoder()
      
      if let decodedFlashCardArray = try? decoder.decode([FlashCardModel].self, from: data) {
        returnableCardsArray = decodedFlashCardArray
      }
    }
    return returnableCardsArray
  }
  
  func saveTotalAmountOfCreatedCards(cardsCategoryTitle: String, totalAmountOfCards: Double) {
    do {
      let encoder = JSONEncoder()
      if let encodedNumberOfThings = try? encoder.encode(totalAmountOfCards) {
        defaults.set(encodedNumberOfThings, forKey: "total\(cardsCategoryTitle)")
      }
    }
  }
  
  func getTotalAmountOfCreatedCards(cardsCategoryTitle: String) -> Double {
    var returnableCardsArray: Double = 0
    
    if let data = UserDefaults.standard.data(forKey: "total\(cardsCategoryTitle)") {
      let decoder = JSONDecoder()
      
      if let decodedFlashCardArray = try? decoder.decode(Double.self, from: data) {
        returnableCardsArray = decodedFlashCardArray
      }
    }
    return returnableCardsArray
  }
}
