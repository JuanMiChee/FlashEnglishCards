//
//  FlashCardsView.swift
//  FlashEnglishCards
//
//  Created by Juan Harrington on 27/11/23.
//

import SwiftUI

struct FlashCardsView: View {
    @State private var rotationAngle: Double = 0
    @State private var offsetX: CGFloat = 0
    @State private var opacity: Double = 1.0
    
    var categoryTitle: String
    var currentBarProgress: Double
    var finalBarProgress: Double
    
    var body: some View {
        ZStack {
            Color("mainBackgroundColour")
            VStack {
                HStack {
                    Text(categoryTitle)
                        .font(.system(size: 25, weight: .bold))
                        .foregroundColor(.white)
                    Spacer()
                    Text("+")
                        .font(.system(size: 45, weight: .bold))
                        .foregroundColor(.white)
                }
                .padding([.top, .leading, .trailing], 48)
                Spacer()
                
                FlashCardView(text: "example card")
                    .rotationEffect(.degrees(rotationAngle))
                    .offset(x: offsetX)
                    .opacity(opacity)
                    .onTapGesture {
                        withAnimation {
                            rotationAngle += 45
                            offsetX += 200
                            opacity = 0
                        }
                    }
                Spacer()
                ProgressView("", value: currentBarProgress, total: finalBarProgress)
                    .scaleEffect(x: 1, y: 2, anchor: .center)
                    .accentColor(.red)
                    .padding(.top, -25)
                    .padding(.horizontal, 60)
                Spacer()
                Spacer()
            }
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButtonView())
    }
}

#Preview {
    FlashCardsView(categoryTitle: "aaa", currentBarProgress: 1, finalBarProgress: 6)
}
