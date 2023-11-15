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
        Text(moreInfoText)
    }
}

#Preview {
    CardMoreInfoView(moreInfoText: "")
}
