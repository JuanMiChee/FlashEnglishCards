//
//  HomeViewViewModel.swift
//  FlashEnglishCards
//
//  Created by Juan Harrington on 10/11/23.
//

import Foundation
import UIKit

class HomeViewViewModel: ObservableObject {
    let dependencies: Dependencies
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    struct Dependencies {
        let getCards: GetCardsUseCase
    }
    
    @Published var viewContent: HomeViewViewContent = HomeViewViewContent(texts: [FlashCardModel(text: "")])
    
    func asignCards() {
        viewContent.texts = dependencies.getCards.execute()
    }
}
