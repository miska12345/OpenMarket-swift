//
//  Item.swift
//  OpenMarketPlace-swift
//
//  Created by Weifeng Li on 9/21/20.
//

import Foundation

struct Item: Identifiable {
    let id: String = UUID().uuidString
    var imageName: String
    var itemName: String
    var itemDescription: String
    var itemAbout: [String]
    var itemPrice: Int
    
}
