//
//  CartViewOrgCell.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/19/20.
//

import SwiftUI

struct CartViewOrgCell: View {
    var body: some View {
        VStack (alignment: .trailing, spacing: 0) {
            HStack (alignment: .top) {
                Label {
                                    Text("Organization of Bubble Tea(2)")
                                        .fontWeight(.semibold)
                                        .lineLimit(1)
                } icon: {
                    Image(systemName: "gamecontroller.fill")
                        .foregroundColor(.white)
                        .background(
                            AppColors.secondaryColor
                        )
                        .clipShape(Circle())
                }
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(Color(hex: 0xe0a6b5))
                }
            }.padding()
            ExDivider(color: Color(hex: 0xe0a6b5), width: 1)
            VStack {
                ForEach(0..<2) { _ in
                    CartViewItemCell()
                }
            }
            HStack (alignment: .bottom) {
                Text("Subtotal:")
//                Text("$20 DashCoin")
//                    .foregroundColor(.red)
                Label {
                    Text("200")
                        .fontWeight(.semibold)
                        .foregroundColor(.red)
                } icon: {
                    Image(systemName: "dollarsign.circle.fill")
                        .foregroundColor(.yellow)
                }
            }.padding()
        }
        .background(
            Color.white
        )
        .clipShape(
            RoundedRectangle(cornerRadius: 15)
        )
        .shadow(color: .gray, radius: 1, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
    }
}

struct CartViewOrgCell_Previews: PreviewProvider {
    static var previews: some View {
        CartViewOrgCell()
    }
}
