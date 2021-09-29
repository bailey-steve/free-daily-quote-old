//
//  Helper.swift
//  Free Daily-Quote
//
//  Created by Salm TCat on 24/09/2021.
//

import Foundation
import UserNotifications

func defaultDate() -> Date {
    
    let isoDate = "2016-04-14T06:00:00+0000"
    
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    let date = dateFormatter.date(from:isoDate)!
    
    return date
}

