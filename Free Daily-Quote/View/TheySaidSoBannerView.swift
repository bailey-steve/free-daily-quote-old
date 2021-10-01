//
//  TheySaidSoBannerView.swift
//  Free Daily-Quote
//
//  Created by Salm TCat on 20/09/2021.
//

import SwiftUI

struct TheySaidSoBannerView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.black)
            HStack{
                let uiImage = UIImage(data: model.theysaidsoImageData)
                Image(uiImage: uiImage ?? UIImage())
                    .resizable()
                    .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding(.leading , 5)
                Text("They Said So®")
                    .foregroundColor(.white)
                    .font(.custom("American Typewriter", size: 16, relativeTo: .headline))
                    .padding(.trailing, 5)
             
            }
            
            
        }
        .fixedSize()
    }
}

struct TheySaidSoBannerView_Previews: PreviewProvider {
    
    @StateObject static var model = ContentModel(preview: true)
    
    static var previews: some View {
        TheySaidSoBannerView()
            .environmentObject(model)
            
    }
}
