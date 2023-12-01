//
//  FlashCardModel.swift
//  FlashEnglishCards
//
//  Created by Juan Harrington on 10/11/23.
//

import Foundation
import SwiftUI

struct FlashCardCategoryModel: Identifiable, Encodable, Decodable {
    let text: String
    let numberOfCards: Int
    let numberOfCompletedCards: Int
    let progressBarColor: String
    var id: String { text }
}
