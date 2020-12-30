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
    
    func getListOfOrgItems(orgId: String, perform: @escaping ([Marketplace_MarketPlaceItem]?, OMError?) -> ()) {
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

    func getOrdersAsBuyer(perform: @escaping ([Marketplace_Order]?, OMError?) -> ()) {
            var request = Marketplace_GetAllOrdersRequest()
            request.role = .buyer
            request.maxCount = Int32(999)
            _ = try? client.getAllOrders(request) { result, callResult in
                //TODO add condition for when result.error is internal service error
                perform(result?.orders, nil)
            }
    }

    func checkout(items: Dictionary<Int32, Int32>, perform: @escaping ([Marketplace_Order]?, OMError?) -> ()) {
        var request = Marketplace_CheckOutRequest()
        request.items = items;
        _ = try? self.client.checkout(request) {result, callResult in
            perform(result?.successOrders, nil)
        }


    }
}
