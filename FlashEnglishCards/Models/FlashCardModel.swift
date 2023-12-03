//
//  FlashCardModel.swift
//  FlashEnglishCards
//
//  Created by Juan Harrington on 1/12/23.
//

import Foundation

struct FlashCardModel: Decodable, Encodable {
    let title: String
    let isFavorite: Bool
    let isReviewed: Bool
}
