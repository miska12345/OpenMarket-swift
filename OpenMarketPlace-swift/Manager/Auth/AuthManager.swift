//
//  AuthManager.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 9/24/20.
//

import Foundation

class AuthManager {
    static let shared = AuthManager()
    private var client: AccountServiceClient
    var isLoggedIn: Bool = false
    var currentUser: User?
    var lastError: String?

    init() {
        client = AccountServiceClient.init(address: Constants.SERVER_ADDRESS, secure: Constants.SECURED_CONNECTION)
    }
    
    func register(uname username: String, pass password: String, perform: @escaping (OMError?) -> ()) {
        var req = RegistrationRequest()
        req.username = username
        req.password = password
        req.displayName = "miska"
        _ = try? client.handleRegister(req) { result, callResult in
            switch result?.registerStatus {
            case .registerSuccess:
                print("Register success")
                perform(nil)
            case .usernameAlreadyExist:
                print("hello")
                perform(OMError(message: "Username already exist"))
            case .invalidParam:
                perform(OMError(message: "Request contain invalid parameters"))
            default:
                perform(OMError(message: "Unknown error"))
            }
        }
    }
    
    func login(uname username: String, pass password: String, perform: @escaping (User?, OMError?) -> ()) {
        var req = LoginRequest()
        req.username = username
        req.password = password
        _ = try? client.handleLogin(req) { result, callResult in
            print(callResult.statusCode)
            switch result?.loginStatus {
            case .loginSuccess:
                self.currentUser = User(username: username, token: result!.cred)
                self.isLoggedIn = true
                print("Your credential is \(String(describing: result?.cred))")
                perform(self.currentUser!, nil)
            case .loginFailIncorrectPasswordOrUsername:
                perform(nil, OMError(message: "Incorrect username or password"))
            case .loginFailInvalidParam:
                perform(nil, OMError(message: "Request contain invalid parameters"))
            default:
                perform(nil, OMError(message: "Unknown error"))
            }
        }
    }
}
