//
//  FlashCardSectionView.swift
//  FlashEnglishCards
//
//  Created by Juan Harrington on 23/11/23.
//

import SwiftUI

struct FlashCardSectionView: View {
    var title: String
    var progresBarCurrentProgress: Int
    var progressBarFinishProgress: Int
    @State var progressBarMaxValueProceced: Int = 0
    
    var body: some View {
        ZStack {
            Color(.white)
            HStack {
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(Color("mainFontColour"))
                    ProgressView("", value: Double(progresBarCurrentProgress),
                                 total: Double(progressBarMaxValueProceced))
                        .scaleEffect(x: 1, y: 2, anchor: .center)
                        .accentColor(Color.random())
                        .padding(.top, -25)
                }
                .padding(.bottom)
                .padding(.horizontal)
                Spacer()
                VStack(alignment: .trailing) {
                    Image("threeDots")
                    Text("\(progresBarCurrentProgress)/\(progressBarFinishProgress)")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(Color("mainFontColour"))
                }
                .padding(.horizontal)
            }
            
        }
        .onAppear {
            if progressBarFinishProgress <= 0 {
                progressBarMaxValueProceced = 1
            } else {
                progressBarMaxValueProceced = progressBarFinishProgress
            }
        }
        .frame(minHeight: 80, maxHeight: 80)
        .cornerRadius(20)
        .padding()
        
    }
}

#Preview {
    FlashCardSectionView(title: "",
                         progresBarCurrentProgress: 20,
                         progressBarFinishProgress: 30)
}
