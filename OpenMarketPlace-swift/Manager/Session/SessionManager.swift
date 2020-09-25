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
    
    func initiateSession() {
        guard let token = AuthManager.shared.currentUser?.token else {
            print("No token")
            return
        }
        DispatchQueue.main.async {
            self.eventManager = EventManager(token)
            self.isLoggedIn = true
        }
        print("Session initiated!")
    }
    
    func isValid() -> Bool {
        return isLoggedIn
    }
}
