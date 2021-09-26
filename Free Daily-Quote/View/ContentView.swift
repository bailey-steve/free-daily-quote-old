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
    
    @State var showSchedule = true
    

    var body: some View {
        
        ZStack()
        {
            //let uiImage = UIImage(data: model.imageData)
            //Image(uiImage: uiImage ?? UIImage())
            Image("road")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                
            
            VStack{
                Spacer()
                if self.showSchedule {
                    
                    NotificationView( showSchedule: $showSchedule)
                    
                }
                else {
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
                                    MenuView(showMenu: self.$showMenu, showSchedule: self.$showSchedule)
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

