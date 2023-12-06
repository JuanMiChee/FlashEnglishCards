//
//  FlashCardsView.swift
//  FlashEnglishCards
//
//  Created by Juan Harrington on 27/11/23.
//

import SwiftUI

struct FlashCardsView: View {
    @State private var rotationAngle: Double = 0
    @State private var offsetX: CGFloat = 0
    @State private var opacity: Double = 1.0
    
    var categoryTitle: String
    var currentBarProgress: Double
    var finalBarProgress: Double
    
    var addCardCompletion: () -> Void
    
    @StateObject var viewModel: FlashCardsViewModel
    
    var body: some View {
        ZStack {
            Color("mainBackgroundColour")
            VStack {
                HStack {
                    Text(categoryTitle)
                        .font(.system(size: 25, weight: .bold))
                        .foregroundColor(.white)
                    Spacer()
                   
                }
                .padding([.top, .leading, .trailing], 48)
                Spacer()
                
                FlashCardView(text: viewModel.viewContent.texts.last?.title ?? "No more cards")
                    .rotationEffect(.degrees(rotationAngle))
                    .offset(x: offsetX)
                    .opacity(opacity)
                    .onTapGesture {
                        withAnimation {
                            rotationAngle += 45
                            offsetX += 200
                            opacity = 0
                        }
                    }
                Spacer()
                ProgressView("", value: currentBarProgress, total: finalBarProgress)
                    .scaleEffect(x: 1, y: 2, anchor: .center)
                    .accentColor(.red)
                    .padding(.top, -25)
                    .padding(.horizontal, 60)
                Spacer()
                Text("+")
                    .onTapGesture {
                        viewModel.isAddNewCardSheetShown = true
                    }
                    .font(.system(size: 45, weight: .bold))
                    .foregroundColor(.white)
                Spacer()
            }
            .sheet(isPresented: $viewModel.isAddNewCardSheetShown) {
                addNewCardSheet
            }
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButtonView())
        .onAppear {
            viewModel.getCards()
        }
        
    }
    
    var addNewCardSheet: some View {
        AddNewCardView(cancelCompletion: { viewModel.isAddNewCardSheetShown = false },
                       saveCompletion: {title in viewModel.saveNewCard(card: FlashCardModel(title: title,
                                                                                            isFavorite: false,
                                                                                            seenCount: 0,
                                                                                            isLearned: false))
            viewModel.isAddNewCardSheetShown = false})
    }
}

@available(iOS 16.0, *)
struct FlashCardsView_Previews: PreviewProvider {
    static var previews: some View {
        FlashCardsView.build(categoryTitle: "test card")
    }
}
