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
    
    @State var showMenu = false
    
    var body: some View {
        
        
        
        ZStack()
        {
            let uiImage = UIImage(data: model.imageData)
            Image(uiImage: uiImage ?? UIImage())
                .resizable()
                .ignoresSafeArea()
            
            VStack(alignment: .center){
                
                let drag = DragGesture()
                    .onEnded {
                        if $0.translation.width < -100 {
                            withAnimation {
                                self.showMenu = false
                            }
                        }
                    }

                GeometryReader { geometry in
                    ZStack(alignment: .leading) {
                        MainView(showMenu: self.$showMenu)
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            .offset(x: self.showMenu ? geometry.size.width/2 : 0)
                            .disabled(self.showMenu ? true : false)
                        if self.showMenu {
                            MenuView(showMenu: self.$showMenu)
                                .frame(width: geometry.size.width/2)
                                .transition(.move(edge: .leading))
                            
                        }
                    }
                    .gesture(drag)
                }
                
                GADBannerViewController()
                    .frame(width: kGADAdSizeBanner.size.width, height: kGADAdSizeBanner.size.height)
            }
        }
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



struct MainView: View {
    
    @EnvironmentObject var model: ContentModel
    @Binding var showMenu: Bool
    
    var body: some View {
        VStack{
            HStack{
                
                Button(action: {
                    withAnimation{
                        self.showMenu = true
                        
                    }
                }) {
                    if self.showMenu == false
                    {
                    Image(systemName: "line.horizontal.3")
                        .imageScale(.large)
                        .foregroundColor(.white)
                    }
                }
                
                Spacer()
                
                Link(destination: URL(string: "https://theysaidso.com")!) {
                    TheySaidSoBannerView()
                }
            }
            
            Spacer()
            
            TextWithBackingView(textValue: model.title)
                .font(.headline)
            
            Spacer()
            
            TextWithBackingView(textValue: model.quote)
                .font(.headline)
            
            Spacer()
            
            HStack{
                Spacer()
                TextWithBackingView(textValue: "Author: \(model.author) ")
                    .font(.caption)
                
                Link(destination: URL(string: "https://theysaidso.com")!) {
                    TextWithBackingView(textValue: "(theysaidso.com)")
                }
                Spacer()
            }
            
            Spacer()
        }
        
    }
}

