//
//  OrganizationStore.swift
//  OpenMarketPlace-swift
//
//  Created by Weifeng Li on 9/22/20.
//

import SwiftUI

struct OrganizationStore: View {
    @State var organization: Organization
    @State var items = [Item]()
    @State var itemPopulated = true
    @ObservedObject var session : SessionManager
    var body: some View {
        ScrollView(.vertical){
            if (itemPopulated) {
                VStack(alignment: .center) {
                    ZStack(){
                        Image(organization.organizationPicture)
                            .resizable()
                            .frame(width: 400, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .aspectRatio(1, contentMode: ContentMode.fill)
                        //Let them define an background image later
                    }
                    Text(organization.organizationName).font(.title)
                    ItemList(listName: "Selling", itemCollection: items, organization: organization, session: session)
                    Spacer()
                }
            } else {
                EmptyView()
            }
        }
        .onAppear {
            if (!itemPopulated) {
                session.marketplaceManager?.getListOfOrgItems(orgId: organization.organizationName, perform: {itemGrpcs, error in
                    DispatchQueue.main.async {
                        for index in 0...(itemGrpcs!.count - 1){
                            if error == nil {
                                let itemgrpc = itemGrpcs![index]
                                
                                self.items.append(Item(id: itemgrpc.itemID, itemName: itemgrpc.itemName, price: itemgrpc.itemPrice, description: itemgrpc.itemDescription, orderQuantity: 0, stock: Int(itemgrpc.itemStock), category: itemgrpc.category, owner: itemgrpc.belongTo))
                            }
                        }
                        self.itemPopulated = true;
                    }
                                                    
                })
            }
            
        }
    }
}

struct OrganizationStore_Previews: PreviewProvider {
    static var previews: some View {
        let temp = Organization(organizationName: "UW Best", organizationPicture: "cssa_logo",
                                organizationDescription: "This is a very big very small very warm club", organizationStoreItems: staticData, organizationStoreCurrency: nil)
        OrganizationStore(organization: temp, session: SessionManager())
    }
}
