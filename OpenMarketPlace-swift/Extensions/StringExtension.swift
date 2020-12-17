//
//  StringExtension.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/15/20.
//

import Foundation

extension String {
    init(date: Date) {
        let dateFormatter: ISO8601DateFormatter = ISO8601DateFormatter()
        self.init(dateFormatter.string(from: date))
    }
    
    static func toCurrencyStr(balance: Double, useSymbol: Bool = false) -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        if !useSymbol {
            formatter.currencySymbol = ""
        }
        return formatter.string(from: NSNumber(value: balance))
    }
    
    static func toShortDateStr(date: Date, timezone: Bool = false) -> String? {
        let dateFormatter: DateFormatter = {
                let formatter = DateFormatter()
            formatter.dateFormat = timezone ? "M/dd h:mm a z" : "M/dd h:mm a"
                return formatter
            }()
        return dateFormatter.string(from: date)
    }
}
