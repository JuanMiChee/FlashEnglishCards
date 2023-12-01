//
//  CustomBackButtonView.swift
//  FlashEnglishCards
//
//  Created by Juan Harrington on 1/12/23.
//

import SwiftUI

struct CustomBackButtonView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.left")  
                .foregroundColor(.white)
                .imageScale(.large)
        }
    }
}

#Preview {
    CustomBackButtonView()
}
