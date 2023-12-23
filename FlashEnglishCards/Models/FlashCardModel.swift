//
//  FlashCardModel.swift
//  FlashEnglishCards
//
//  Created by Juan Harrington on 1/12/23.
//

import Foundation

struct FlashCardModel: Codable {
  let title: String
  let id: String
  var isFavorite: Bool
  var seenCount: Int {
    return seenDates.count
  }
  var isLearned: Bool
  var seenDates: [Date]
}
