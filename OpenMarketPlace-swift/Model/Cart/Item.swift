//
//  Item.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 9/21/20.
//

import Foundation

struct Item: Identifiable, Hashable {
    let id: String
    let itemName: String
    let price: Double
    let description: String
    let quantity: Int
    
    func getTotalPriceRounded() -> String {
        return String(format: "%.2f", price * Double(quantity))
    }
}
