//
//  CartViewOrgCell.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/19/20.
//

import SwiftUI

struct CartViewOrgCell: View {
    @ObservedObject var cart: Cart
    @EnvironmentObject var session: SessionManager
    var body: some View {
        VStack (alignment: .trailing, spacing: 0) {
            HStack (alignment: .top) {
                Label {
                    Text(cart.shopName)
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
                Button(action: {
                    self.session.cartManager?.deleteCart(orgName: self.cart.shopName)
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(Color(hex: 0xe0a6b5))
                }
            }.padding()
            ExDivider(color: Color(hex: 0xe0a6b5), width: 1)
            VStack {
                ForEach(cart.items) { item in
                    CartViewItemCell(isQuantityChangable: true, item: item)
                }
            }
            HStack (alignment: .bottom) {
                Text("Subtotal:")
//                Text("$20 DashCoin")
//                    .foregroundColor(.red)
                Label {
                    Text(String(cart.subtotal))
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
        CartViewOrgCell(cart: Cart(id: "bruh", shopName: "Organization of Bubble Tea", items: []))
    }
}
