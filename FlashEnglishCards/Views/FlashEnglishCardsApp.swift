//
//  FlashEnglishCardsApp.swift
//  FlashEnglishCards
//
//  Created by Juan Harrington on 9/11/23.
//

import SwiftUI

@main
struct FlashEnglishCardsApp: App {
  @State private var isDarkModeEnabled = false
  
  var body: some Scene {
    WindowGroup {
      HomeView.build()
        .environment(\.colorScheme, isDarkModeEnabled ? .dark : .light)
        .onChange(of: isDarkModeEnabled) { _ in
          updateColorScheme()
        }
    }
  }
  
  private func updateColorScheme() {
    UIApplication.shared.windows.forEach { window in
      window.overrideUserInterfaceStyle = isDarkModeEnabled ? .dark : .light
    }
  }
}
