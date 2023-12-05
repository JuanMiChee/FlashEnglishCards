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

@available(iOS 17.0, *)
struct CustomBackButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CustomBackButtonView()
    }
}
