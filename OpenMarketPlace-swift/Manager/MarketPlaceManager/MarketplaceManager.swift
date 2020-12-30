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
}
