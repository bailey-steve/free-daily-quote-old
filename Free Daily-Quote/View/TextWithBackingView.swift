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
            Spacer()
            ZStack{
                RoundedRectangle(cornerRadius: 3)
                    .foregroundColor(.black.opacity(0.4))
                    
                Text(textValue)
                    .foregroundColor(.white)
                    .padding()
                    .multilineTextAlignment(.center)
                    
            }
            Spacer()
        }
    }
}

struct TextWithBackingView_Previews: PreviewProvider {
    static var previews: some View {
        TextWithBackingView(textValue: "Test value")
            
    }
}
