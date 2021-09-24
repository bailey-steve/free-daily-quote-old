//
//  NotificationView.swift
//  Free Daily-Quote
//
//  Created by Salm TCat on 22/09/2021.
//

import SwiftUI
import UserNotifications


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
           
            VStack {
                Button("Schedule Notification") {
                    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                        if success {
                            
                            let content = UNMutableNotificationContent()
                            content.title = "Daily Quote"
                            content.subtitle = "Your daily quote is available."
                            content.sound = UNNotificationSound.default
                            
                            let components = Calendar.current.dateComponents([.hour, .minute], from: currentDate)
                            print(components)
                            
                            let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: true)

                            // choose a random identifier
                            let request = UNNotificationRequest(identifier: "Quote1234", content: content, trigger: trigger)

                            // add our notification request
                            UNUserNotificationCenter.current().add(request)
                            
                            
                        } else if let error = error {
                            print(error.localizedDescription)
                        }
                    }
                }
            }
        
            
        /*
        Button {
            self.showSchedule = false
            print("CURRENT DATE \($currentDate)")
                
        } label: {
            TextWithBackingView(textValue: "Confirm")
        }
        */
        Spacer()
        }
    }
}

