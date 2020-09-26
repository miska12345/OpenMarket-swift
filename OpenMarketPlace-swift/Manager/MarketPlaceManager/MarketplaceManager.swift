//
//  MarketplaceManager.swift
//  OpenMarketPlace-swift
//
//  Created by Weifeng Li on 9/25/20.
//

import Foundation
import SwiftGRPC
import grpc

class MarketplaceManager: ObservableObject {
    private var client: Marketplace_MarketPlaceServiceClient;
    
    init(_ token: String) {
        client = Marketplace_MarketPlaceServiceClient(address: Constants.SERVER_ADDRESS, secure: Constants.SECURED_CONNECTION)
        
        try! client.metadata.add(key: Constants.AUTH_TOKEN_ATTRIBUTE, value: token)
        print("Marketplace client initialized")
    }
    
    func getListOfOrgItems(orgId: String, perform: @escaping ([Marketplace_ItemGrpc]?, OMError?) -> ()) {
        var request = Marketplace_GetOrgItemsRequest();
        request.orgID = orgId;
        _ = try? client.handleGetOrgItems(request) {result, callResult in
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
    
    func getSimilarItems(itemId: String, itemCategory: String, withCount: Int,
                         perform: @escaping ([Marketplace_ItemGrpc]?, OMError?) -> ()) {
        var request = Marketplace_GetSimilarItemsRequest()
        request.itemIds = itemId
        request.itemCategory = itemCategory
        request.withCount = Int32(withCount)
        
        _ = try? self.client.handleGetSimilarItems(request) {result, callResult in
            if let realItem = result?.items {
                DispatchQueue.main.async {
                    perform(realItem, nil)
                }
            }
            else {
                perform(nil, OMError(message: "Error while getting similar items for \(itemId)"))
            }
        }
    }
    
}
