//
//  Cart.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 9/21/20.
//

import Foundation

class Cart: Identifiable, ObservableObject, Equatable {
    //currency id
    let id: String
    let shopName: String
    @Published var subtotal = 0.0
    @Published var items = [Item]()
    
    init(id:String, shopName: String, items: [Item]) {
        self.id = id
        self.shopName = shopName
        self.items = items
        updateSubtotal()
    }
    
    func setItemQuantity(with item: Item, q quantity: Int) {
        if let index = items.firstIndex(of: item) {
            let oldQuantity = items[index].orderQuantity
            items[index].orderQuantity = quantity
            updateSubtotal(price: item.price, quantity: quantity - oldQuantity)
        }
    }
    
    func addItem(with item: Item) {
        self.items.append(item)
    }
    
    func removeItem(with item: Item) {
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
            updateSubtotal(price: item.price, quantity: -1 * item.orderQuantity)
        } else {
            print("Item not found")
        }
    }
    
    func updateSubtotal() {
        var currentSubtotal = 0.0
        for item in items {
            currentSubtotal += item.price * Double(item.orderQuantity)
        }   
        updateSubtotalHelper(with: currentSubtotal)
    }
    
    func updateSubtotal(price: Double, quantity: Int) {
        updateSubtotalHelper(with: price * Double(quantity))
        
    }
    
    func updateSubtotalHelper(with updateAmount: Double) {
        self.subtotal = max(0, self.subtotal + updateAmount)
    }
    
    static func == (lhs: Cart, rhs: Cart) -> Bool {
        return lhs.id == rhs.id
    }
    
    func getSubtotalRounded() -> String {
        return String(format: "%.2f", self.subtotal)
    }
    
    func contains(item: Item) -> Bool {
        return self.items.contains(item);
    }
    
    // EventListeners
    
    func onQuantityDidChanged(for item: Item, q quantity: Int) {
        setItemQuantity(with: item, q: quantity)
    }
    
    func onDeleteItemTapped(for item: Item) {
        removeItem(with: item)
    }
}
