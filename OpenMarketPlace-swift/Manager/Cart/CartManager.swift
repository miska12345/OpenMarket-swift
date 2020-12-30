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
    
    
    func isCartEmpty() -> Bool {
        return self.carts.count == 0
    }
    
    func addItemToCart(newItem: Item, orgName: String, quanity: Int) {
        var toAdd = newItem.copy()
        toAdd.orderQuantity = quanity
        if let potentialCart = self.carts[orgName] {
            potentialCart.addItem(with: toAdd)
        } else {

            self.carts[orgName] = Cart(id: newItem.itemCurrency, shopName: orgName, items: [toAdd])
        }
        
    }
    
    func deleteCart(orgName: String) {
        self.carts.removeValue(forKey: orgName)
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
            var result = [String]()
            for item in self.carts[orgName]!.items {
                result.append(item.itemName)
            }
            defaults.setValue(result, forKey: orgName)
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
    

    func getCartsKeys() -> [String] {
        var result = [String]()
        for (key, _) in self.carts {
            result.append(key)
        }
        
        return result
    }
    
    
    
    func convertToItemGrpc(item : Item) -> Marketplace_MarketPlaceItem {
        var itemgrpc = Marketplace_MarketPlaceItem()
        itemgrpc.itemID = Int32(item.id)
        itemgrpc.itemName = item.itemName
        itemgrpc.itemPrice = item.price
        itemgrpc.belongTo = item.owner
        
        return itemgrpc
    }
}
