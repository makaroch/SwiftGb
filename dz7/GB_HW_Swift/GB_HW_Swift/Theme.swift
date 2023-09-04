//
//  Theme.swift
//  GB_HW_Swift
//
//  Created by Alina on 23.08.2023.
//  Copyright © 2023 Alina. All rights reserved.
//

import UIKit

enum AllAppTheme: String{
    case white
    case blue
    case black
}
protocol AppTheme{
    var backgroundColor: UIColor{get}
    var textColor: UIColor{get}
    var subtitleTextColor: UIColor{get}
    var type: AllAppTheme{get}
    
}
extension AppTheme{
    var subtitleTextColor: UIColor{
        .gray
    }
}
final class Theme {
    static var currentTheme: AppTheme = WhiteTheme()
}
final class BlueTheme: AppTheme{
    var backgroundColor: UIColor = UIColor(red: 228/225, green: 231/255, blue: 255, alpha:1)
    var textColor: UIColor = .brown
    var type: AllAppTheme = .blue
    var subtitleTextColor: UIColor = .blue
    
}
final class WhiteTheme: AppTheme{
    var backgroundColor: UIColor = .white
    var textColor: UIColor = .black
    var type: AllAppTheme = .white
    
}
final class BlackTheme: AppTheme{
    var backgroundColor: UIColor = .black
    var textColor: UIColor = .white
    var type: AllAppTheme = .black
    
}

//protocol AppTheme {
//    var backgroundColor: UIColor { get }
//}
//
//final class Theme {
//    static var currentTheme: AppTheme = WhiteTheme()
//
//    static func drawDate(date: Date?) -> String {
//        if date == nil { return "" }
//        let dateFormatter = DateFormatter()
//        dateFormatter.timeStyle = .medium
//        dateFormatter.dateStyle = .medium
//        dateFormatter.timeZone = .current
//        dateFormatter.locale = Locale(identifier: "ru_RU")
//        return dateFormatter.string(from: date!)
//    }
//}
//
//final class WhiteTheme: AppTheme {
//    var backgroundColor: UIColor = .white
//}
//
//final class BlueTheme: AppTheme {
//    var backgroundColor: UIColor = UIColor(red: 228/255, green: 231/255, blue: 1, alpha: 1)
//}
//
//final class GreenTheme: AppTheme {
//    var backgroundColor: UIColor = UIColor(red: 206/255, green: 1, blue: 162/255, alpha: 1)
//}
