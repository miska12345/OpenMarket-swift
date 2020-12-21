//
//  OrganizationView.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/19/20.
//

import SwiftUI

struct OrganizationView: View {
    @State var selection: Int = 0
    var body: some View {
        ZStack {
            AppColors.lightGray
            ScrollView () {
                VStack {
                    OrgTitleBar()
                    Image("TestPoster2")
                        .resizable()
                        .frame(height: 250, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        
                    OrgEventsBar()
                    OrgItemGrid()
                }
            }
        }
    }
}

struct OrganizationView_Previews: PreviewProvider {
    static var previews: some View {
        OrganizationView()
    }
}
