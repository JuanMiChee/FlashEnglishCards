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
        HStack {
            Image(systemName: "circle.fill")
            Text(text)
            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.gray, radius: 4, x: 0, y: 4)
        .padding(.horizontal)
    }
}

struct FlashCardView_Previews: PreviewProvider {
    static var previews: some View {
        FlashCardView(text: "Algo de prueba")
    }
}
