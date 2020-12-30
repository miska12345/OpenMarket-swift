//
//  ItemDetailViewInfo.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/19/20.
//

import SwiftUI

struct ItemDetailViewInfo: View {
    var item : Item
    var body: some View {
        VStack (alignment: .leading) {
            HStack (alignment: .top) {
                Text(item.itemName)
                    .font(.headline)
//                    .minimumScaleFactor(0.5)
                    .lineLimit(2)
                Spacer()
                Image(systemName: "heart").resizable()
                    .frame(width: 20, height: 20, alignment: .center)
                    .scaledToFit()
                Image(systemName: "square.and.arrow.up").resizable()
                    .frame(width: 20, height: 20, alignment: .center)
                    .scaledToFit()
            }
            .padding(.bottom, 5)
            HStack (alignment: .bottom) {
                HStack (alignment: .bottom) {
                    Text(String.toCurrencyStr(balance: item.price, useSymbol: true)!)
                        .bold()
                        .font(.system(size: 35))
                        .minimumScaleFactor(0.5)
                        .foregroundColor(.red)
                        .scaledToFill()
    //                Spacer()
                    Text("DashCoin")
                        .foregroundColor(.gray)
    //                    .padding(.top)
                }
                Spacer()
                NavigationLink(destination: OrganizationView(),
                               label: {
                                HStack {
                                    Image("DefaultAvatar_Male")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 25, height: 25, alignment: .center)
                                        .clipShape(Circle())
                                    Text(self.item.owner)
                                        .font(.system(size: 12))
                                        .lineLimit(2)
                                        .multilineTextAlignment(.leading)
                                }
                                .frame(width: 150)
                               }
                ).buttonStyle(PlainButtonStyle())
//                HStack {
//                    Image("DefaultAvatar_Male")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 25, height: 25, alignment: .center)
//                        .clipShape(Circle())
//                    Text("Organization of Bubble Tea")
//                        .font(.system(size: 12))
//                        .lineLimit(2)
//                        .multilineTextAlignment(.leading)
//                }
//                .frame(width: 150)
            }
        }
    }
}

//struct ItemDetailViewInfo_Previews: PreviewProvider {
//    static var previews: some View {
//        ItemDetailViewInfo()
//    }
//}
