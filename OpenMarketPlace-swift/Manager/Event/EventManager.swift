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
    private var dateFormatter: ISO8601DateFormatter = ISO8601DateFormatter()
    private var ownedEventLastEvKey: String = ""
    
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
    
    func create(name: String, currency: String, rewardAmount: Double, totalAmount: Double, endDate: Date, perform: @escaping (String?, OMError?)->()) {
        print("create called")
        if (currency.isEmpty || rewardAmount > totalAmount || rewardAmount <= 0 || totalAmount <= 0 || endDate < Date()) {
            perform(nil, OMError(message: "Invalid Input"))
            return;
        }
        var req = Event_CreateEventRequest()
        req.name = name
        req.currency = currency
        req.rewardAmount = rewardAmount
        req.totalAmount = totalAmount
        req.expiresAt = dateFormatter.string(from: endDate)
        _ = try? client.createEvent(req) { result, callResult in
            print(callResult)
            switch result?.error {
            case .nothing:
                perform(result?.eventID, nil)
            case .outOfCoins:
                perform(nil, OMError(message: "You don't have enough of the selected currency!"))
            default:
                perform(nil, OMError(message: "Unknown error"))
            }
        }
    }
    
    func deleteEvent(eventId: String, perform:  @escaping (OMError?)->()) {
        print("delete event called")
        if eventId.isEmpty {
            perform(OMError(message: "Invalid EventID \(eventId)"))
            return
        }
        var req = Event_DeleteEventRequest()
        req.eventID = eventId
        _ = try? client.deleteEvent(req) { result, callResult in
            switch result?.error {
            case .nothing:
                perform(nil)
            case .unauthorized:
                perform(OMError(message: "You are not authorized to perform this operation."))
            default:
                perform(OMError(message: "Unknown error"))
            }
        }
    }
    
    func getOwnedEvent(perform: @escaping ([Event_Event]?, OMError?)->()) {
        print("get own event called")
        var req = Event_GetEventListRequest()
        req.maxCount = 999
        req.ownerID = AuthManager.shared.currentUser!.username
        _ = try? client.getEventList(req) { result, callResult in
            perform(result?.events, nil)
        }
    }
}
