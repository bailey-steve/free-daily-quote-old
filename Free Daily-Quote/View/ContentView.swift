//
//  ContentView.swift
//  Free Daily Quote
//
//  Created by Steve Bailey on 14/09/2021.
//
import SwiftUI
import GoogleMobileAds


struct ContentView: View {
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        ZStack()
        {
            let uiImage = UIImage(data: model.imageData)
            Image(uiImage: uiImage ?? UIImage())
                .resizable()
                
                VStack(alignment: .center){
                    
                    Spacer()
                    
                    TextWithBackingView(textValue: model.title)
                        .font(.headline)

                    //TextWithBackingView(textValue: String(model.random))
                    Spacer()

                    TextWithBackingView(textValue: model.quote)
                        .font(.headline)
                        

                    Spacer()
                    
                    TextWithBackingView(textValue: "Author: \(model.author)")
                        .font(.caption)

                    Spacer()

                GADBannerViewController()
                    .frame(width: kGADAdSizeBanner.size.width, height: kGADAdSizeBanner.size.height)
            }
            
            
            
        }
        .ignoresSafeArea()
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
            model.getQuote()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    @EnvironmentObject var model: ContentModel
    
    static var previews: some View {
        
        ContentView()
            .environmentObject(ContentModel(preview: true))
    }
}


