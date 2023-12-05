//
//  FlashCardModel.swift
//  FlashEnglishCards
//
//  Created by Juan Harrington on 10/11/23.
//

import Foundation
import SwiftUI

struct FlashCardCategoryModel: Identifiable, Encodable, Decodable, Equatable {
    
    static func == (lhs: FlashCardCategoryModel, rhs: FlashCardCategoryModel) -> Bool {
        return lhs.text == rhs.text &&
        lhs.numberOfCards == rhs.numberOfCards &&
        lhs.numberOfCompletedCards == rhs.numberOfCompletedCards &&
        lhs.progressBarColor == rhs.progressBarColor
    }
    
    var text: String
    let flashCards: [FlashCardModel]
    let numberOfCards: Int
    let numberOfCompletedCards: Int
    let progressBarColor: String
    var id: String { text }
}
