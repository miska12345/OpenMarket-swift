//
//  DateExtension.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/15/20.
//

import Foundation

extension Date {
    static func fromStr(timestamp: String) -> Date? {
        let dateFormatter: ISO8601DateFormatter = ISO8601DateFormatter()
        let a = dateFormatter.date(from: timestamp)
        return a
    }
    
    func getElapsedInterval() -> String {
        let interval = Calendar.current.dateComponents([.year, .month, .day], from: self, to: Date())
        if let year = interval.year, year > 0 {
            return year == 1 ? "\(year)" + " " + "year ago" :
                "\(year)" + " " + "years ago"
        } else if let month = interval.month, month > 0 {
            return month == 1 ? "\(month)" + " " + "month ago" :
                "\(month)" + " " + "months ago"
        } else if let day = interval.day, day > 0 {
            return day == 1 ? "Yesterday" :
                "\(day)" + " " + "days ago"
        } else {
            return "Today"
        }
    }
}
