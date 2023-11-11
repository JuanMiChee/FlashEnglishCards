//
//  PlusButtonStyle.swift
//  FlashEnglishCards
//
//  Created by Juan Harrington on 10/11/23.
//

import Foundation
import SwiftUI

struct PlusButtonStyle: ButtonStyle {
    let desiredBackgroundColor: Color
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 8)
            .font(.title)
            .foregroundColor(.black)
            .padding()
            .background(desiredBackgroundColor)
            .cornerRadius(10)
            .shadow(color: Color.gray, radius: 4, x: 0, y: 4)
            .padding(20)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}
