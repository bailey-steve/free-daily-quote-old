//
//  MenuView.swift
//  Free Daily-Quote
//
//  Created by Salm TCat on 20/09/2021.
//

import SwiftUI

struct MenuView: View {
    
    @Binding var showMenu: Bool
    @Binding var showSchedule: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Spacer()
            HStack {
                Button{
                    showMenu = false
                    showSchedule = true
                    
                } label: {
                Image(systemName: "bell")
                Text("Notification")
                }
            }
            .padding(.top, 20)

            Link(destination: URL(string: "https://salmtcat.wordpress.com/free-daily-quotes-privacy-policy/")!) {
                HStack {
                    Image(systemName: "lock")
                    Text("Privacy")
                }
            }
            .padding(.top, 20)
            
            Link(destination: URL(string: "https://salmtcat.wordpress.com/free-daily-quotes-terms-and-conditions/")!){
                HStack {
                    Image(systemName: "scroll")
                    Text("Terms")
                }
            }
            .padding(.top, 20)
            Spacer()
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(red: 32/255, green: 32/255, blue: 32/255))
        .edgesIgnoringSafeArea(.all)
        .imageScale(.large)
        .foregroundColor(.white)
        //.font(.custom("American Typewriter", size: 16, relativeTo: .headline))
        
    }
}
