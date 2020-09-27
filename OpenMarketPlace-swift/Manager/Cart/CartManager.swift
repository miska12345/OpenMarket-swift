//
//  CartManager.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 9/22/20.
//

import Foundation

class CartManager: ObservableObject {
    
    @Published var carts = [Cart]()
    @Published var session : SessionManager
    init(carts: [Cart], session : SessionManager) {
        self.carts = carts
        self.session = session
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
    
    func onCheckoutTapped(for cart: Cart, perform: @escaping ([Marketplace_ItemGrpc]?, OMError?) -> ()) {
        let toCheckOut = self.carts[self.carts.firstIndex(of: cart)!]
        var checkoutItems = [Marketplace_ItemGrpc]()
        for item in toCheckOut.items{
            checkoutItems.append(convertToItemGrpc(item: item))
        }
        session.marketplaceManager?.checkout(items: checkoutItems, orgId: toCheckOut.shopName, currencyId: toCheckOut.id, perform: perform)
    }
    
    func convertToItemGrpc(item : Item) -> Marketplace_ItemGrpc {
        var itemgrpc = Marketplace_ItemGrpc()
        itemgrpc.itemID = item.id
        itemgrpc.itemName = item.itemName
        itemgrpc.itemPrice = item.price
        itemgrpc.itemCount = Int32(item.orderQuantity)
        itemgrpc.belongTo = item.owner
        
        return itemgrpc
    }
}
