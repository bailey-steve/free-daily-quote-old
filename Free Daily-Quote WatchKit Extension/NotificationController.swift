//
//  NotificationController.swift
//  Free Daily-Quote WatchKit Extension
//
//  Created by user198386 on 14/09/2021.
//

import WatchKit
import SwiftUI
import UserNotifications



class NotificationController: WKUserNotificationHostingController<NotificationView> {
    
    @EnvironmentObject var model: ContentModel

    override var body: NotificationView {
        return NotificationView()
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    override func didReceive(_ notification: UNNotification) {
        // This method is called when a notification needs to be presented.
        // Implement it if you use a dynamic notification interface.
        // Populate your dynamic notification interface as quickly as possible.
    }
}
