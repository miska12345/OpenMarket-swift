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
}
