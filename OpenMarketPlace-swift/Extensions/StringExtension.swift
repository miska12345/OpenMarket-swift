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
    
    static func toCurrencyStr(balance: Double) -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        return formatter.string(from: NSNumber(value: balance))
    }
}
