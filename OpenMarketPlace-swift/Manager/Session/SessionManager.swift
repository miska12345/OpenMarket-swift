//
//  SessionManager.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 9/25/20.
//

import Foundation

class SessionManager: ObservableObject {
    private var isLoggedIn: Bool = false
    @Published var eventManager: EventManager? = nil
    @Published var transactionManager: TransactionManager? = nil
    @Published var marketplaceManager: MarketplaceManager? = nil
    @Published var cartManager: CartManager? = nil
    @Published var newsfeedmanager: NewsFeedManager? = nil
    @Published var organizationManager: OrganizationManager? = nil
    func initiateSession() {
        guard let token = AuthManager.shared.currentUser?.token else {
            print("No token")
            return
        }
        DispatchQueue.main.async {
            self.eventManager = EventManager(token)
            self.transactionManager = TransactionManager(token)
            self.marketplaceManager = MarketplaceManager(token)
            self.isLoggedIn = true
            self.cartManager = CartManager(carts: [String : Cart](), session: self)
            self.newsfeedmanager = NewsFeedManager(token)
            self.organizationManager = OrganizationManager(token)
        }
        print("Session initiated!")
    }
    
    func isValid() -> Bool {
        return isLoggedIn
    }
}
