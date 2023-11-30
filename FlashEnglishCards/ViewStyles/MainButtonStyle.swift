//
//  MainButotnStyle.swift
//  FlashEnglishCards
//
//  Created by Juan Harrington on 10/11/23.
//

import Foundation
import SwiftUI

struct MainButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 70)
            .font(.system(size: 20, weight: .bold))
            .padding(10)
            .foregroundColor(.white)
            .padding(.horizontal, 30)
            .background(Color("mainFontColour"))
            .cornerRadius(20)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.white, lineWidth: 2)
            )
    }
}
