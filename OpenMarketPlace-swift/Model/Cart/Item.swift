//
//  Item.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 9/21/20.
//

import Foundation

struct Item: Identifiable, Hashable, Equatable {
    let id: String
    let itemName: String
    let price: Double
    let description: String
    var orderQuantity: Int
    var stock: Int
    var imageName: String = "cssa_logo"
    let category: String
    let owner: String
    //ADD THIS TO INIT LATER
    let itemCurrency: String = "FuckCoin"
    
    func getTotalPriceRounded() -> String {
        return String(format: "%.2f", price * Double(orderQuantity))
    }
    
    func copy() -> Item{
        return Item(id: self.id, itemName: self.itemName, price: self.price, description: self.description, orderQuantity: self.orderQuantity, stock: self.stock, category: self.category, owner: self.owner)
    }
    
    static func == (lhs: Item, rhs: Item) -> Bool {
        return lhs.id == rhs.id
    }
}
