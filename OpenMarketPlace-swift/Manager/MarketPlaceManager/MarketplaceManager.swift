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
    
    func getOrdersAsBuyer(perform: @escaping ([Marketplace_Order]?, OMError?) -> ()) {
        var request = Marketplace_GetAllOrdersRequest()
        request.role = .buyer
        request.maxCount = 999
        _ = try? client.getAllOrders(request) { result, callResult in
            perform(result?.orders, nil)
        }
    }
    
//
//    func getListOfOrgItems(orgId: String, perform: @escaping ([Marketplace_ItemGrpc]?, OMError?) -> ()) {
//        var request = Marketplace_GetOrgItemsRequest();
//        request.orgID = orgId;
//        _ = try? client.handleGetOrgItems(request) {result, callResult in
//            if let realItem = result?.items  {
//                DispatchQueue.main.async {
//                    perform(realItem, nil)
//                }
//            }
//            else {
//                perform(nil, OMError(message: "No result found"))
//            }
//
//        }
//
//    }
//
//    func getSimilarItems(itemId: String, itemCategory: String, withCount: Int,
//                         perform: @escaping ([Marketplace_ItemGrpc]?, OMError?) -> ()) {
//        var request = Marketplace_GetSimilarItemsRequest()
//        request.itemIds = itemId
//        request.itemCategory = itemCategory
//        request.withCount = Int32(withCount)
//
//        _ = try? self.client.handleGetSimilarItems(request) {result, callResult in
//            if let realItem = result?.items {
//                DispatchQueue.main.async {
//                    perform(realItem, nil)
//                }
//            }
//            else {
//                perform(nil, OMError(message: "Error while getting similar items for \(itemId)"))
//            }
//        }
//    }
//
//    func checkout(items: [Marketplace_ItemGrpc], orgId: String, currencyId: String, perform: @escaping ([Marketplace_ItemGrpc]?, OMError) -> ()) {
//        var request = Marketplace_CheckOutRequest()
//        request.items = items;
//        request.fromOrg = orgId;
//        request.currencyID = currencyId
//        _ = try? self.client.handleCheckout(request) {result, callResult in
//            switch(result?.checkoutStatus) {
//                case .success:
//                    perform(nil, OMError(message: "Success"))
//                case .sucessWithFewItemOutOfStock:
//                     perform(result?.unprocessedItem, OMError(message: "Success, the following items are out of stock"))
//                case .failItemOutOfStock:
//                    perform(result?.unprocessedItem, OMError(message: "Sorry, all items are out of stock"))
//                case .failPaymentCannotBeVerified, .failTransactionTimeOut:
//                    perform(nil, OMError(message: "Sorry, your payment can not be verfied or your request timed out please try again later"))
//                default:
//                    perform(nil, OMError(message: "Unknown error, probably COVID-19"))
//            }
//        }
//
//
//    }
    
}
