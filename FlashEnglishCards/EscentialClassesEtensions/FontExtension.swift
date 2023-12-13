//
//  FontExtension.swift
//  FlashEnglishCards
//
//  Created by Juan Harrington on 23/11/23.
//

import Foundation
import SwiftUI

extension Font {
  static func system(
    size: CGFloat,
    weight: UIFont.Weight,
    width: UIFont.Width) -> Font {
      return Font(
        UIFont.systemFont(
          ofSize: size,
          weight: weight,
          width: width)
      )
    }
}
