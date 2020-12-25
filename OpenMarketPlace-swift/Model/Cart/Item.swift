//
//  Item.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 9/21/20.
//

import Foundation

class Item: Equatable, Identifiable{
    let id: String
    let itemName: String
    let price: Double
    let itemDescription: String
    var orderQuantity: Int
    var stock: Int
    var imageName: String = "cssa_logo"
    let category: String
    let owner: String
    //ADD THIS TO INIT LATER
    let itemCurrency: String = "DashCoin"
    
    init(id: String, itemName: String, price: Double, itemDescription: String, orderQuantity: Int, stock: Int, category: String, owner: String) {
        self.id = id;
        self.itemName = itemName
        self.price = price
        self.itemDescription = itemDescription
        self.orderQuantity = orderQuantity
        self.stock = stock
        self.category = category
        self.owner = owner
    }
    
    func getTotalPriceRounded() -> String {
        return String(format: "%.2f", price * Double(orderQuantity))
    }
    
    func copy() -> Item{
        return Item(id: self.id, itemName: self.itemName, price: self.price, itemDescription : self.itemDescription, orderQuantity: self.orderQuantity, stock: self.stock, category: self.category, owner: self.owner)
    }
    
    static func == (lhs: Item, rhs: Item) -> Bool {
        return lhs.id.elementsEqual(rhs.id)
    }
}
