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
