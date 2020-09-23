//
//  Organization.swift
//  OpenMarketPlace-swift
//
//  Created by Weifeng Li on 9/21/20.
//

import Foundation

struct Organization: Identifiable {
    let id: String = UUID().uuidString    
    var organizationName: String
    var organizationPicture: String
    var organizationDescription: String
    var organizationStoreItems: [Item]?
    var organizationStoreCurrency: [String]?
}
