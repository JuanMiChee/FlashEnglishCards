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
    
    var body: some View {
        ZStack {
            Color("mainBackgroundColor")
            VStack {
                HStack {
                    Text("aaaaa")
                        .font(.system(size: 25, weight: .bold))
                        .foregroundColor(.white)
                    Spacer()
                    Text("+")
                        .font(.system(size: 45, weight: .bold))
                        .foregroundColor(.white)
                }
                .padding(40)
                Spacer()
                
                FlashCardView(text: "paaaaa")
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
                ProgressView("", value: 49, total: 100)
                    .scaleEffect(x: 1, y: 2, anchor: .center)
                    .accentColor(.red)
                    .padding(.top, -25)
                    .padding(.horizontal, 60)
                Spacer()
                Spacer()
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    FlashCardsView()
}
