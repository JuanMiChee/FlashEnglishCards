//
//  FlashCardSectionView.swift
//  FlashEnglishCards
//
//  Created by Juan Harrington on 23/11/23.
//

import SwiftUI

struct FlashCardSectionView: View {
    var title: String
    var progresBarColor: Color
    var progresBarCurrentProgress: Int
    var progressBarFinishProgress: Int
    
    var body: some View {
        ZStack {
            Color(.white)
            HStack {
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(Color("mainFontColor"))
                    ProgressView("", value: 49, total: 100)
                        .scaleEffect(x: 1, y: 2, anchor: .center)
                        .accentColor(progresBarColor)
                        .padding(.top, -25)
                }
                .padding(.bottom)
                .padding(.horizontal)
                Spacer()
                VStack(alignment: .trailing) {
                    Image("threeDots")
                    Text("50/100")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(Color("mainFontColor"))
                }
                .padding(.horizontal)
            }
            
        }
        .frame(minHeight: 80, maxHeight: 80)
        .cornerRadius(20)
        .padding()
        
    }
}

#Preview {
    FlashCardSectionView(title: "", 
                         progresBarColor: .red,
                         progresBarCurrentProgress: 1,
                         progressBarFinishProgress: 1)
}
