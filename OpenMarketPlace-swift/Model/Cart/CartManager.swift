//
//  CartManager.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 9/22/20.
//

import Foundation

class CartManager: ObservableObject {
    static let shared = CartManager(carts: [])
    
    @Published var carts = [Cart]()
    
    init(carts: [Cart]) {
        self.carts = carts
    }
    
    func addCart(for cart: Cart) {
        carts.append(cart)
    }
    
    func deleteCart(for cart: Cart) {
        if let index = carts.firstIndex(of: cart) {
            carts.remove(at: index)
        } else {
            print("No such cart")
        }
    }
    
    func fetchData() {
        print("Fetching data")
        addCart(for: Cart(id: "1", shopName: "Fish", items: [
            Item(id: "1", itemName: "Apple", price: 3.13, description: "Good for your health", quantity: 5)
        ]))
    }
    
    func onDeleteCartTapped(for cart: Cart) {
        if (cart.items.count == 0) {
            deleteCart(for: cart)
        }
    }
    
    func onCheckoutTapped(for cart: Cart) {
        print("Checkout!")
    }
}
