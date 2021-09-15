//
//  Free_Daily_QuoteApp.swift
//  Free Daily-Quote
//
//  Created by user198386 on 14/09/2021.
//

import SwiftUI
//import Firebase
import GoogleMobileAds



@main
struct Free_Daily_QuoteApp: App {
    
    init() {
        //FirebaseApp.configure()
                
        GADMobileAds.sharedInstance().start(completionHandler: nil)
        
        // LIVE GADMobileAds.configure(withApplicationID: "ca-app-pub-5914410712409724~8834268568")
        //GADMobileAds.configure(withApplicationID: "ca-app-pub-3940256099942544/2934735716")
        
        
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ContentModel())
            
        }
    }
}
