//
//  Event.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 9/24/20.
//

import Foundation
import SwiftGRPC
import grpc

class EventManager {
    private var client: Event_StampEventServiceClient
    
    init(_ token: String) {
        client = Event_StampEventServiceClient.init(address: Constants.SERVER_ADDRESS, secure: Constants.SECURED_CONNECTION)
        try! client.metadata.add(key: Constants.AUTH_TOKEN_ATTRIBUTE, value: token)
        print("EventManager initialized")
    }
    
    func redeem(_ eventId: String, perform: @escaping (Event_Event?, OMError?)->()) {
        var req = Event_RedeemRequest()
        req.eventID = eventId
        _ = try? client.redeem(req) { result, callResult in
            print(callResult)
            switch result?.error {
            case .nothing:
                perform(result?.event, nil)
            case .invalidEventID, .alreadyRedeemed, .outOfCoins:
                perform(nil, OMError(message: result?.message))
            default:
                perform(nil, OMError(message: "Unknown error"))
            }
        }
    }
}
