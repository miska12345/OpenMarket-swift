//
//  CartManager.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 9/22/20.
//

import Foundation

class CartManager: ObservableObject {
    
    @Published var carts = [Cart]()
    
    init(carts: [Cart]) {
        self.carts = carts
    }
    
    func addCart(for cart: Cart) {
        for oldCart in carts {
            if (cart.id == oldCart.id) {
                return
            }
            
        }
        self.carts.append(cart)
    }
    
    func addItemToCart(newItem: Item) {
        let currency = newItem.itemCurrency
        for cart in carts {
            if (cart.id == currency){
                cart.addItem(with: newItem)
                return
            }
        }
        addCart(for: Cart(id: currency, shopName: newItem.owner, items: [newItem]))
    }
    
    func deleteCart(for cart: Cart) {
        if let index = carts.firstIndex(of: cart) {
            carts.remove(at: index)
        } else {
            print("No such cart")
        }
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
