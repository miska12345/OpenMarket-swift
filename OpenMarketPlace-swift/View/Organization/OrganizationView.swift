//
//  OrganizationView.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/19/20.
//

import SwiftUI

struct OrganizationView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var session: SessionManager
    @State var organization = OrgMetadata()
    var orgID: String = "testOrgx"
    var body: some View {
        ZStack(alignment: .top) {
            AppColors.lightGray
            VStack(alignment: .leading, spacing: 0) {
                GeneralBackButton()
                    .padding()
                    .background(Color.white)
                ScrollView () {
                    VStack(spacing: 0) {
                        OrgTitleBar(name: organization.orgName, currency: organization.orgCurrency)
                        Image("TestPoster2")
                            .resizable()
                            .frame(height: 250, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        
                        VStack {
                            OrgEventsBar()
                            OrgItemGrid()
                        }.padding(.top)
                    }
                }
            }
        }
        .navigationBarHidden(true)
        .onAppear(perform: {
            session.organizationManager?.getOrg(name: orgID, perform: { (org, error) in
                if error == nil {
                    self.organization = org!
                } else {
                    print(error?.message!)
                }
            })
        })
    }
}

struct OrganizationView_Previews: PreviewProvider {
    static var previews: some View {
        OrganizationView()
    }
}
