//
//  OrganizationView.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/19/20.
//

import SwiftUI

struct OrganizationView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var selection: Int = 0
    var body: some View {
        ZStack(alignment: .top) {
            AppColors.lightGray
            VStack(alignment: .leading, spacing: 0) {
//                Label {
//                    Text("Back")
//                        .fontWeight(.semibold)
//                        .lineLimit(1)
//                } icon: {
//                    Image(systemName: "chevron.left")
//                }.onTapGesture {
//                    self.presentationMode.wrappedValue.dismiss()
//                }.padding(.horizontal)
//                .padding(.top)
//                .background(
//                    Color.white
//                )
                GeneralBackButton()
                    .padding()
                    .background(Color.white)
                ScrollView () {
                    VStack(spacing: 0) {
                        OrgTitleBar()
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
    }
}

struct OrganizationView_Previews: PreviewProvider {
    static var previews: some View {
        OrganizationView()
    }
}
