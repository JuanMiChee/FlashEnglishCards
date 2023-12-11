//
//  FlashCardCategoryView.swift
//  FlashEnglishCards
//
//  Created by Juan Harrington on 23/11/23.
//

import SwiftUI

struct FlashCardCategoryView: View {
    var title: String
    var progresBarCurrentProgress: Int
    var progressBarFinishProgress: Int
    var categoryEditClosure: () -> Void
    var caregoryDeleteClosure: () -> Void
    
    @State var progressBarMaxValueProceced: Int = 0
    
    @State var showEditAlert: Bool = false
    @State var showDeleteAlert: Bool = false
    
    var body: some View {
        ZStack {
            Color(.white)
            HStack {
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(Color("mainFontColour"))
                    ProgressView("", value: Double(progresBarCurrentProgress),
                                 total: Double(progressBarMaxValueProceced))
                        .scaleEffect(x: 1, y: 2, anchor: .center)
                        .accentColor(Color.random())
                        .padding(.top, -25)
                }
                .padding(.bottom)
                .padding(.horizontal)
                Spacer()
                VStack(alignment: .trailing) {
                    HStack {
                        Image(systemName: "applepencil.and.scribble")
                            .onTapGesture {
                                showEditAlert = true
                            }
                        Image(systemName: "trash")
                            .onTapGesture {
                                showDeleteAlert = true
                            }
                    }
                    
                    Text("\(progresBarCurrentProgress)/\(progressBarFinishProgress)")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(Color("mainFontColour"))
                }
                .padding(.horizontal)
            }
            .alert(Text("Want to edit this category?"), isPresented: $showEditAlert, actions: {
                Button("Cancel") { }
                Button("Edit") { categoryEditClosure() }
            })
            .alert(Text("Want to delete this category?"), isPresented: $showDeleteAlert, actions: {
                Button("Cancel") { }
                Button("delete") { caregoryDeleteClosure() }
            })
            
        }
        .onAppear {
            if progressBarFinishProgress <= 0 {
                progressBarMaxValueProceced = 1
            } else {
                progressBarMaxValueProceced = progressBarFinishProgress
            }
        }
        .frame(minHeight: 80, maxHeight: 80)
        .cornerRadius(20)
        .padding()
        
    }
}
struct FlashCardCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        FlashCardCategoryView(title: "",
                             progresBarCurrentProgress: 20,
                             progressBarFinishProgress: 30,
                             categoryEditClosure: {},
                             caregoryDeleteClosure: {})
    }
}
