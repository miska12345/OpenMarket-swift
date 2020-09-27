//
//  TransactionManager.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 9/25/20.
//

import Foundation

class TransactionManager {
    private var client: Transaction_TransactionServiceClient
    
    init(_ token: String) {
        client = Transaction_TransactionServiceClient.init(address: Constants.SERVER_ADDRESS, secure: Constants.SECURED_CONNECTION)
        try! client.metadata.add(key: Constants.AUTH_TOKEN_ATTRIBUTE, value: token)
        print("TransactionManager initialized")
    }
    
    func getWallet(perform: @escaping (Dictionary<String,Double>?, OMError?)->()) {
        let req = Transaction_GetWalletRequest()
        _ = try? client.processGetWallet(req) { result, callResult in
            print(callResult)
            perform(result?.currencies, nil)
        }
    }
    
    func getPaidTransactions(perform: @escaping ([Transaction_QueryResultItem]?, OMError?)->()) {
        var req = Transaction_QueryRequest()
        req.type = Transaction_QueryRequest.QueryType.payerID
        _ = try? client.processQuery(req) { result, callResult in
            perform(result?.items, nil)
        }
    }
    
    func getReceivedTransactions(perform: @escaping ([Transaction_QueryResultItem]?, OMError?)->()) {
        var req = Transaction_QueryRequest()
        req.type = Transaction_QueryRequest.QueryType.recipientID
        _ = try? client.processQuery(req) { result, callResult in
            perform(result?.items, nil)
        }
    }
}
