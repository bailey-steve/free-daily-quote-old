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
            Image("road")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width) //, height: UIScreen.main.bounds.height)
                .clipped()
            
            VStack{
                Spacer()

                if model.showSchedule  {
                    
                    NotificationView()
                    
                }
                else {
                    VStack(alignment: .center){
                        
                        let drag = DragGesture()
                            .onEnded {
                                if $0.translation.width < -100 {
                                    withAnimation {
                                        model.showMenu = false
                                    }
                                }
                            }
                        
                        GeometryReader { geometry in
                            ZStack(alignment: .leading) {
                                MainView()
                                    .frame(width: geometry.size.width, height: geometry.size.height)
                                    .offset(x: model.showMenu ? geometry.size.width/2 : 0)
                                    .disabled(model.showMenu ? true : false)
                                if model.showMenu {
                                    MenuView()
                                        .frame(width: geometry.size.width/2)
                                        .transition(.move(edge: .leading))
                                    
                                }
                            }
                            .gesture(drag)
                        }
                    }
                    
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
