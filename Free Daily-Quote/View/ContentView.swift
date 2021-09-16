//
//  ContentView.swift
//  Free Daily-Quote
//
//  Created by user198386 on 14/09/2021.
//
import SwiftUI
import GoogleMobileAds


struct ContentView: View {
    @EnvironmentObject var model: ContentModel

    var body: some View {
        
        VStack(){
            
            VStack(alignment: .center){
                
                Spacer()
                Text(model.title)
                    .font(.title)
                    .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
                        model.getQuote()
                    }

                Spacer()
                
                let uiImage = UIImage(data: model.imageData)
                Image(uiImage: uiImage ?? UIImage())
                    .resizable()
                    .scaledToFit()
                
                Spacer()
                Text(model.quote)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                Spacer()
                Text("Author: \(model.author)")
                    .font(.caption)
                    .multilineTextAlignment(.center)
                Spacer()
            }
            
            
            GADBannerViewController()
                .frame(width: kGADAdSizeBanner.size.width, height: kGADAdSizeBanner.size.height)
        }
        
        .ignoresSafeArea()
        
        
        
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    
    @EnvironmentObject var model: ContentModel
    
    static var previews: some View {
        
        ContentView()
            .environmentObject(ContentModel(preview: true))
    }
}
