//
//  OrgTitleBar.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/20/20.
//

import SwiftUI

struct OrgTitleBar: View {
    var name = "Organization Name"
    var currency = "DashCoin"
    var followers = 0
    var body: some View {
        HStack(alignment: .top) {
            ZStack(alignment: .bottomTrailing) {
                Image("DefaultAvatar_Male")
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
            }
            VStack (alignment: .leading) {
                Text(name)
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                    .minimumScaleFactor(0.5)
                    .scaledToFill()
                    .foregroundColor(.black)
                Label {
                    Text(currency)
                        .foregroundColor(.gray)
                } icon: {
                    Image(systemName: "dollarsign.circle.fill")
                        .foregroundColor(.yellow)
                }
                HStack (alignment: .bottom) {
                    Label {
                        Text(String(followers))
                            .foregroundColor(.gray)
                    } icon: {
                        Image(systemName: "heart.circle.fill")
                            .foregroundColor(AppColors.primaryColor)
                    }
                    Spacer()
                    Image(systemName: "heart")
                        .foregroundColor(AppColors.secondaryColor)
                }
            }
        }
        .frame(height: 65)
        .padding(10)
        .background(Color.white)
    }
}

struct OrgTitleBar_Previews: PreviewProvider {
    static var previews: some View {
        OrgTitleBar()
    }
}
