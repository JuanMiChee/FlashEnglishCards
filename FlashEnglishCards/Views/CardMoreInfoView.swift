//
//  CardMoreInfoView.swift
//  FlashEnglishCards
//
//  Created by Juan Harrington on 15/11/23.
//

import SwiftUI

struct CardMoreInfoView: View {
    let moreInfoText: String
    
    var body: some View {
        VStack(alignment: .trailing) {
            HStack {
                Text("moreInfoTextas  asdas as as das das dasd as as d asd asd as asd ")
                    .font(.system(size: 20, weight: .bold))
                    .padding(40)
                    .foregroundColor(Color("mainFontColor"))
                Spacer()
            }
            .padding(.top)
            Spacer()
            Image("engranaje")
                .padding([.bottom, .trailing], 20)//Lets pretend this is a star for now
        }
        .frame(minHeight: 500, maxHeight: 500)
        .background(Color.red)
        .cornerRadius(20)
        .padding()
    }
}

#Preview {
    CardMoreInfoView(moreInfoText: "asaaa")
}
