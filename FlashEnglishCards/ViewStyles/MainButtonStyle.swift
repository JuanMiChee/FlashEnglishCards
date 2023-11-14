//
//  MainButotnStyle.swift
//  FlashEnglishCards
//
//  Created by Juan Harrington on 10/11/23.
//

import Foundation
import SwiftUI

struct MainButtonStyle: ButtonStyle {
    let desiredBackgroundColor: Color
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 60)
            .padding(10)
            .foregroundColor(.white)
            .padding(.horizontal, 30)
            .background(desiredBackgroundColor)
            .cornerRadius(8)
            .shadow(color: Color.gray, radius: 4, x: 0, y: 4)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}
