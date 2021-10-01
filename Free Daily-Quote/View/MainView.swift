//
//  MainView.swift
//  Free Daily-Quote
//
//  Created by Salm TCat on 20/09/2021.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var model: ContentModel

    var body: some View {
        VStack{
            HStack{
                
                Button(action: {
                    withAnimation{
                        model.showMenu = true
                        
                    }
                }) {
                    if model.showMenu == false
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

    static var previews: some View {
        MainView()
            .environmentObject(model)
            
    }
}

