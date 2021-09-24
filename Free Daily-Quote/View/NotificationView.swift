//
//  NotificationView.swift
//  Free Daily-Quote
//
//  Created by Salm TCat on 22/09/2021.
//

import SwiftUI


struct NotificationView: View {
    
    @Binding var showSchedule: Bool

    
    @State var currentDate: Date = defaultDate()

    
    var body: some View {
        VStack{
        
        Spacer()
        
            TextWithBackingView(textValue: "At what time each day would you like to be notified of your new quote?")
              
        VStack (alignment: .center, spacing: 0)
        {
  
            DatePicker("", selection: $currentDate, displayedComponents: .hourAndMinute)
                .colorInvert()
                .datePickerStyle(WheelDatePickerStyle())
                .labelsHidden()
                
                
            
        }
                       
            
            Button {
                
                //self.showSchedule = false
                print("CURRENT DATE \($currentDate)")
                
            } label: {
                TextWithBackingView(textValue: "Confirm")
                
            }
            
        Spacer()
        }
    }
}

