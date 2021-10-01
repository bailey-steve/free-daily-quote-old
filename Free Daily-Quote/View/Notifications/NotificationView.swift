//
//  NotificationView.swift
//  Free Daily-Quote
//
//  Created by Salm TCat on 22/09/2021.
//

import SwiftUI

struct NotificationView: View {
    
    @EnvironmentObject var model: ContentModel

    var body: some View {
        
        if model.notificationSetting == .denied {
            TextWithBackingView(textValue: "Disallowed")
        }
        else
        {
            VStack{
                NotificationAllowedView()
            }
        }
    }
}

struct NotificationView_Previews: PreviewProvider {
    
    @StateObject static var model = ContentModel(preview: true)

    static var previews: some View {
        NotificationView()
            .environmentObject(model)   
    }
}
