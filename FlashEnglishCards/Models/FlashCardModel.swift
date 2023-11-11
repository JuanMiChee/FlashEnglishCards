//
//  FlashCardModel.swift
//  FlashEnglishCards
//
//  Created by Juan Harrington on 10/11/23.
//

import Foundation

struct FlashCardModel: Identifiable, Encodable, Decodable {
    let text: String
    var id: String { text }
}
