//
//  AddNewCategoryView.swift
//  FlashEnglishCards
//
//  Created by Juan Harrington on 27/11/23.
//

import SwiftUI

struct AddNewCategoryView: View {
    var cancelCompletion: (() -> Void)
    var saveCompletion: ((_ title: String) -> Void)
    @State var categoryTitle: String = ""
    
    var body: some View {
        ZStack {
            Color("mainBackgroundColour")
            VStack {
                Spacer()
                Spacer()
                Text("Add your category tittle.")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundColor(Color(.white))
                TextField(
                    "Category name",
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
        .ignoresSafeArea()
    }
}

#Preview {
    AddNewCategoryView(cancelCompletion: {}, saveCompletion: {titulo in })
}
