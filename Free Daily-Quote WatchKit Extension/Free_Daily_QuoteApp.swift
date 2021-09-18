//
//  Free_Daily_QuoteApp.swift
//  Free Daily-Quote WatchKit Extension
//
//  Created by user198386 on 14/09/2021.
//

import SwiftUI

@main
struct Free_Daily_QuoteApp: App {
   
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
                    .environmentObject(ContentModel())
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}



