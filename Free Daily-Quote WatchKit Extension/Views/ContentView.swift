//
//  ContentView.swift
//  Free Daily-Quote WatchKit Extension
//
//  Created by user198386 on 14/09/2021.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model: ContentModel

    init() {
        
    }
    
    
    var body: some View {

        VStack{
            Text(model.quote)
                .padding()
        }.onAppear(perform: {
            model.getQuote()
        })


        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
