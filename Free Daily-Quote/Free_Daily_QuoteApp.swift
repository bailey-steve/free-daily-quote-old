//
//  Free_Daily_QuoteApp.swift
//  Free Daily-Quote
//
//  Created by user198386 on 14/09/2021.
//

import SwiftUI

@main
struct Free_Daily_QuoteApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ContentModel())
            
        }
    }
}
