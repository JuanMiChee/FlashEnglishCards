//
//  FlashCardView.swift
//  FlashEnglishCards
//
//  Created by Juan Harrington on 10/11/23.
//

import SwiftUI

struct FlashCardView: View {
    var text: String
    var body: some View {
        VStack(alignment: .trailing) {
            
            Image("engranaje")
                .padding([.top, .trailing], 20)//Lets pretend this is a star for now
            Spacer()
            HStack {
                Spacer()
                Text(text)
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(Color("mainFontColor"))
                Spacer()
            }
            .padding(.bottom)
            Spacer()
        }
        .frame(minHeight: 500, maxHeight: 500)
        .background(Color.white)
        .cornerRadius(20)
        .padding()
    }
}

struct FlashCardView_Previews: PreviewProvider {
    static var previews: some View {
        FlashCardView(text: "Algo de prueba")
    }
}
