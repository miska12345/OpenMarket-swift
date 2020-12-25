//
//  CartManager.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 9/22/20.
//

import Foundation

class CartManager: ObservableObject {
    
    @Published var carts = [String: Cart]()
    let CACHED_ORG = "CACHE_LIST_OF_ORGS"
    let defaults = UserDefaults.standard
    @Published var session : SessionManager
    
    init(carts: [String : Cart], session : SessionManager) {
        self.carts = carts
        self.session = session
    }
    
//    func addCart(for cart: Cart, orgName: String) {
//        carts[orgName] = cart
//    }
    
    func addItemToCart(newItem: Item, orgName: String) {
        print("called")
        if let potentialCart = self.carts[orgName] {
            potentialCart.addItem(with: newItem)
        } else {
            self.carts[orgName] = Cart(id: newItem.itemCurrency, shopName: orgName, items: [newItem])
        }
        self.onUpdateCarts(orgName: orgName)
        
    }
    
    func deleteCart(for cart: Cart, orgName: String) {
        self.carts.removeValue(forKey: orgName)
    }
    
    func onDeleteCartTapped(for cart: Cart, orgName: String) {
        if (cart.items.count == 0) {
            deleteCart(for: cart, orgName: orgName)
        }
    }
    
//    func onCheckoutTapped(for cart: Cart, perform: @escaping ([Marketplace_ItemGrpc]?, OMError?) -> ()) {
//        let toCheckOut = self.carts[self.carts.firstIndex(of: cart)!]
//        var checkoutItems = [Marketplace_ItemGrpc]()
//        for item in toCheckOut.items{
//            checkoutItems.append(convertToItemGrpc(item: item))
//        }
//        session.marketplaceManager?.checkout(items: checkoutItems, orgId: toCheckOut.shopName, currencyId: toCheckOut.id, perform: perform)
//    }
    
    func getListingFromCache() {
        print("called cache")
        guard let savedOrgs = defaults.value(forKey: CACHED_ORG) as? [String] else {
            print("you fucked up")
            return
        }
        
        print(defaults.value(forKey: savedOrgs[0]) as! [String])
        
        
    }
    
    func onUpdateCarts(orgName: String) {
        guard let savedOrgs = defaults.value(forKey: CACHED_ORG) as! NSArray? else {
            defaults.setValue([orgName] as NSArray, forKey: CACHED_ORG)
            defaults.setValue(self.carts[orgName], forKey: orgName)
            return
        }
        
        if (!savedOrgs.contains(orgName)) {
            savedOrgs.adding(orgName)
            defaults.setValue(savedOrgs, forKey: self.CACHED_ORG)
        }
        
        var result = [String]()
        for item in self.carts[orgName]!.items {
            result.append(item.itemName)
        }
        defaults.setValue(result, forKey: orgName)
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
