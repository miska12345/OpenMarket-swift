//
//  OrganizationManager.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/29/20.
//

import Foundation

class OrganizationManager {
    private var client : OrganizationServiceClient;
    init(_ token: String) {
        client = OrganizationServiceClient(address: Constants.SERVER_ADDRESS, secure: Constants.SECURED_CONNECTION)
        
        try! client.metadata.add(key: Constants.AUTH_TOKEN_ATTRIBUTE, value: token)
        print("Organization client initialized")
    }
    
    func getOrg(name: String, perform: @escaping (OrgMetadata?, OMError?) -> ()) {
        var req = GetOrgRequest()
        req.orgName = name
        _ = try? client.getOrganization(req) {result, callResult in
            if result?.error == Error.none {
                perform(result?.organization, nil)
            } else {
                perform(nil, OMError(message: "Organization \(name) does not exist"))
            }
        }
    }
}
