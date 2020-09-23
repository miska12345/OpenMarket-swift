//
//  OrganizationStore.swift
//  OpenMarketPlace-swift
//
//  Created by Weifeng Li on 9/22/20.
//

import SwiftUI

struct OrganizationStore: View {
    @State var organization: Organization
    var body: some View {
        ScrollView(.vertical){
            VStack(alignment: .center) {
                ZStack(){
                    Image(organization.organizationPicture)
                        .resizable()
                        .frame(width: 400, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .aspectRatio(1, contentMode: ContentMode.fill)
                    //Let them define an background image later
                }
                Text("UW CSSA").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                ItemList(listName: "Selling", itemCollection: organization.organizationStoreItems!, organization: organization)
                Spacer()
            }
        }
    }
}

struct OrganizationStore_Previews: PreviewProvider {
    static var previews: some View {
        let temp = Organization(organizationName: "UW Best", organizationPicture: "cssa_logo",
                                organizationDescription: "This is a very big very small very warm club", organizationStoreItems: staticData, organizationStoreCurrency: nil)
        OrganizationStore(organization: temp)
    }
}
