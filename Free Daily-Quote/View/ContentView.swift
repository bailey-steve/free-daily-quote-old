//
//  ContentView.swift
//  Free Daily-Quote
//
//  Created by user198386 on 14/09/2021.
//
import SwiftUI


struct ContentView: View {
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        ZStack(){

                GeometryReader { geometry in
                    VStack(alignment: .leading){
                    Spacer()
                    Text(model.title)
                        .font(.title)
                    Spacer()
                    
                    let uiImage = UIImage(data: model.imageData)
                           Image(uiImage: uiImage ?? UIImage())
                            .resizable()
                            .frame(width: geometry.size.width, height: geometry.size.height/3)
                            .scaledToFit()
                             
                        
                        
                        Spacer()
                        Text(model.quote)
                        .font(.headline)
                    Spacer()
                    Text("Author: \(model.author)")
                        .font(.caption)
                    Spacer()
                }

                 
             }
            .padding()
            .ignoresSafeArea()
            


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
