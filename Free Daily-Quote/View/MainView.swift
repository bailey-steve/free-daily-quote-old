//
//  MainView.swift
//  Free Daily-Quote
//
//  Created by Salm TCat on 20/09/2021.
//

import SwiftUI

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
                .padding()
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
            
            
            TextWithBackingView(textValue: "Author: \(model.author) ")
                .font(.caption)
            
            Link(destination: URL(string: "https://theysaidso.com")!) {
                TextWithBackingView(textValue: "(theysaidso.com)")
                
            }
            
            Spacer()
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    
    @StateObject static var model = ContentModel(preview: true)
    @State static var showMenu = false
    
    static var previews: some View {
        MainView(showMenu: $showMenu)
            .environmentObject(model)
            
    }
}

