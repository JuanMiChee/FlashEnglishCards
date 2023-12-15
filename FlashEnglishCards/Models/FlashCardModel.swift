//
//  FlashCardModel.swift
//  FlashEnglishCards
//
//  Created by Juan Harrington on 1/12/23.
//

import Foundation

struct FlashCardModel: Decodable, Encodable {
  let title: String
  var isFavorite: Bool
  var seenCount: Int {
    return seenDates.count
  }
  var isLearned: Bool
  var seenDates: [Date]
}
