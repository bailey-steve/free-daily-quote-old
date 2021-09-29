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
                    .foregroundColor(.black)
                    .bold()
                    .multilineTextAlignment(.center)
                    .font(.title2)
                    .background(Color.white.opacity(0.3))
                    .cornerRadius(5)
                    
            }
        }
    }
}

struct TextWithBackingView_Previews: PreviewProvider {
    static var previews: some View {
        TextWithBackingView(textValue: "Test value")
            
    }
}
