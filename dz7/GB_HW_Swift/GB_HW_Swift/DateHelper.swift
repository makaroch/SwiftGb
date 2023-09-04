//
//  DateHelper.swift
//  GB_HW_Swift
//
//  Created by Alina on 23.08.2023.
//  Copyright © 2023 Alina. All rights reserved.
//

import Foundation

final class DateHelper{
    static func getDate(date: Date?) -> String {
        guard let date else {
            return ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM YYY hh:mm"
        dateFormatter.locale = Locale(identifier: "ru_RU")
        
        return dateFormatter.string(from: date)
    }
}
