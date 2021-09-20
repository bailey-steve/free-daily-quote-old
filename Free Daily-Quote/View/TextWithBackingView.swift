//
//  TextWithBackingView.swift
//  Free Daily-Quote
//
//  Created by Salm TCat on 16/09/2021.
//

import SwiftUI

struct TextWithBackingView: View {
    
    var textValue: String = ""
    
    var body: some View {
        HStack{
            ZStack{
                Text(textValue)
                    .foregroundColor(.white)
                    .bold()
                    .multilineTextAlignment(.center)
                    .font(.custom("American Typewriter", size: 16, relativeTo: .headline))
                    
            }
        }
    }
}

struct TextWithBackingView_Previews: PreviewProvider {
    static var previews: some View {
        TextWithBackingView(textValue: "Test value")
            
    }
}
