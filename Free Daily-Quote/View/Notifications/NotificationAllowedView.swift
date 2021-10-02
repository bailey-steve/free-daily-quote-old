//
//  NotificationAllowedView.swift
//  Free Daily-Quote
//
//  Created by Salm TCat on 27/09/2021.
//

import SwiftUI

struct NotificationAllowedView: View {
    
    @EnvironmentObject var model: ContentModel
    @State var currentDate: Date = defaultDate()

    var body: some View {
        
        VStack{
            
            Spacer()
            
            TextWithBackingView(textValue: "At what time each day would you like to be notified of your new quote?")
            VStack (alignment: .center, spacing: 0)
            {
                DatePicker("", selection: $currentDate, displayedComponents: .hourAndMinute)
                    .datePickerStyle(WheelDatePickerStyle())
                    .labelsHidden()
                    .background(Color.white.opacity(0.3))
                    .cornerRadius(15)
                
            }
            Spacer()

            VStack {
                Button {
                    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                        if success {
                            
                            let content = UNMutableNotificationContent()
                            content.title = "Daily Quote"
                            content.subtitle = "Your daily quote is available."
                            content.sound = UNNotificationSound.default
                            
                            let components = Calendar.current.dateComponents([.hour, .minute], from: currentDate)
                            print(components)
                            
                            let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: true)
                            
                            let request = UNNotificationRequest(identifier: "Quote1234", content: content, trigger: trigger)
                            
                            // add our notification request
                            UNUserNotificationCenter.current().add(request)
                            
                            
                            
                        } else if let error = error {
                            print(error.localizedDescription)
                        }
                        model.updateNotificationStatus()
                        model.showSchedule = false
                    }
                } label: {
                    Text( "Schedule Notification")
                        .bold()
                        .multilineTextAlignment(.center)
                        .font(.title2)
                }
                .buttonStyle(.borderedProminent)
                
                Button{
                    model.updateNotificationStatus()
                    model.showSchedule = false
                    // TODO : Skip property
                }
            label: {
                Text( "Skip")
                    .bold()
                    .multilineTextAlignment(.center)
                    .font(.title2)
            }
            .buttonStyle(.borderedProminent)
            .padding()
                
            }
            
            Spacer()
        }
    }
}

struct NotificationAllowedView_Previews: PreviewProvider {
    
    @StateObject static var model = ContentModel(preview: true)
    @State static var currentDate: Date = defaultDate()
    
    static var previews: some View {
        NotificationAllowedView(currentDate: currentDate)
            .environmentObject(model)
        
    }
}

