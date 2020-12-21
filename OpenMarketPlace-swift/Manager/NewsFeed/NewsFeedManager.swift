//
//  NewsFeedManager.swift
//  OpenMarketPlace-swift
//
//  Created by Weifeng Li on 12/20/20.
//

import Foundation
class NewsFeedManager {
    private var client : Newsfeed_NewsFeedServiceClient;
    init(_ token: String) {
        client = Newsfeed_NewsFeedServiceClient(address: Constants.SERVER_ADDRESS, secure: Constants.SECURED_CONNECTION)
        
        try! client.metadata.add(key: Constants.AUTH_TOKEN_ATTRIBUTE, value: token)
        print("Marketplace client initialized")
    }
    
    func getTopDeals(limit: Int, category: String, perform: @escaping ([Newsfeed_ItemGrpc]?, OMError?) -> ()) {

        var request = Newsfeed_TopDealsRequest();
        request.limit = Int32(limit);
        request.category = category
        _ = try? client.getTopDeals(request) {result, callResult in
            if let realItem = result?.items  {
                DispatchQueue.main.async {
                    perform(realItem, nil)
                }
            }
            else {
                perform(nil, OMError(message: "No result found"))
            }
            
        }
    }
}
