//
//  ContentView.swift
//  Free Daily-Quote WatchKit Extension
//
//  Created by user198386 on 14/09/2021.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model: ContentModel

    var body: some View {
        Text(model.quote)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
