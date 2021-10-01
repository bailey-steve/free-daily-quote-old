//
//  Banner.swift
//  Free Daily-Quote
//
//  Created by Steve Bailey on 15/09/2021.
//

import GoogleMobileAds
import SwiftUI
import UIKit

struct GADBannerViewController: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let view = GADBannerView(adSize: kGADAdSizeBanner)
        let viewController = UIViewController()
        
        // Live
        // view.adUnitID = "ca-app-pub-5914410712409724/2118678791"
        
        // Test
        view.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        
        view.rootViewController = viewController
        viewController.view.addSubview(view)
        viewController.view.frame = CGRect(origin: .zero, size: kGADAdSizeBanner.size)
        view.load(GADRequest())
        return viewController
        
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
}
