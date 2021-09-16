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

            VStack(){
                
                VStack(alignment: .center){
                    
                    Spacer()
                   
                    
                        Text(model.title)
                            .font(.title)
                            .foregroundColor(.white)
                            
                        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
                            model.getQuote()
                        }

                    Spacer()
                    Text(model.quote)
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                    Spacer()
                    Text("Author: \(model.author)")
                        .font(.caption)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                    Spacer()
                }
                
                
                GADBannerViewController()
                    .frame(width: kGADAdSizeBanner.size.width, height: kGADAdSizeBanner.size.height)
            }
            

            
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
