//
//  NotificationView.swift
//  Free Daily-Quote
//
//  Created by Salm TCat on 22/09/2021.
//

import SwiftUI



struct NotificationView: View {
    
    @EnvironmentObject var model: ContentModel
    
    @Binding var showSchedule: Bool
    
    
    
    var body: some View {
        
        if model.notificationSetting == .denied {
            TextWithBackingView(textValue: "Disallowed")
        }
        else
        {
            VStack{
                NotificationAllowedView(showSchedule: $showSchedule)
            }
        }
        
    }
}

struct NotificationView_Previews: PreviewProvider {
    
    @StateObject static var model = ContentModel(preview: true)
    @State static var showSchedule = false
    
    static var previews: some View {
        NotificationView(showSchedule: $showSchedule)
            .environmentObject(model)
            
    }
}
