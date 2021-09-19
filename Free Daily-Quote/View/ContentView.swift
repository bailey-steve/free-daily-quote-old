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
                .ignoresSafeArea()
            
            VStack(alignment: .center){
                
                HStack{
                    Spacer()
                    Button(action: {
                        
                        if let url = URL(string: "https://theysaidso.com") {
                            UIApplication.shared.open(url)
                        }
                    }) {
                        ZStack{
                            Rectangle()
                                .foregroundColor(.black)
                            HStack{
                                let uiImage = UIImage(data: model.theysaidsoImageData)
                                Image(uiImage: uiImage ?? UIImage())
                                    .resizable()
                                    .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .padding(.leading, 5)
                                Text("They Said So®")
                                    .foregroundColor(.white)
                                    .font(.custom("American Typewriter", size: 16, relativeTo: .headline))
                                    
                                Spacer()
                            }
                            
                            
                        }
                        .fixedSize()
                        
                    }
                }
                
                Spacer()
                
                TextWithBackingView(textValue: model.title)
                    .font(.headline)
                
                //TextWithBackingView(textValue: String(model.random))
                Spacer()
                
                TextWithBackingView(textValue: model.quote)
                    .font(.headline)
                
                
                Spacer()
                
                HStack{
                    Spacer()
                    TextWithBackingView(textValue: "Author: \(model.author) ")
                        .font(.caption)
                    
                    Button(action: {
                        
                        if let url = URL(string: "https://theysaidso.com") {
                            UIApplication.shared.open(url)
                        }
                    }) {
                        TextWithBackingView(textValue: "(theysaidso.com)")
                            //.foregroundColor(.white)
                            //.font(.custom("American Typewriter", size: 16, relativeTo: .headline))
                        
                        
                    }
                    Spacer()
                }

                Spacer()
                
                GADBannerViewController()
                    .frame(width: kGADAdSizeBanner.size.width, height: kGADAdSizeBanner.size.height)
            }
            
            
            
        }
        //.ignoresSafeArea()
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


