//
//  AddNewCardView.swift
//  FlashEnglishCards
//
//  Created by Juan Harrington on 5/12/23.
//

import SwiftUI

struct AddNewCardView: View {
  var cancelCompletion: (() -> Void)
  var saveCompletion: ((_ title: String) -> Void)
  @State var categoryTitle: String = ""
  
  var body: some View {
    ZStack {
      Color("mainBackgroundColour")
        .ignoresSafeArea()
      VStack {
        Spacer()
        Spacer()
        Text("Add your card tittle.")
          .font(.system(size: 30, weight: .bold))
          .foregroundColor(Color(.white))
        TextField(
          "card name",
          text: $categoryTitle
        )
        .padding()
        .background(Color(.white))
        .overlay(
          RoundedRectangle(cornerRadius: 20)
            .stroke(.gray, lineWidth: 5)
        )
        .cornerRadius(20)
        .padding(.horizontal, 20)
        .padding(.bottom)
        Spacer()
        Button("Save") {
          saveCompletion(categoryTitle)
        }
        .buttonStyle(MainButtonStyle())
        Button("Cancel") {
          cancelCompletion()
        }
        .buttonStyle(MainButtonStyle())
        .padding(.bottom, 30)
      }
    }
  }
}

#Preview {
  AddNewCardView(cancelCompletion: {}, saveCompletion: {title in })
}
