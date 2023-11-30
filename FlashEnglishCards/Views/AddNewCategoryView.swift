//
//  AddNewCategoryView.swift
//  FlashEnglishCards
//
//  Created by Juan Harrington on 27/11/23.
//

import SwiftUI

struct AddNewCategoryView: View {
    @State var a = ""
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
                    text: $a
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
                    
                }
                .buttonStyle(MainButtonStyle())
                Button("Cancel") {
                    
                }
                .buttonStyle(MainButtonStyle())
                .padding(.bottom, 30)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    AddNewCategoryView()
}
