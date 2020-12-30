//
//  OrderCell.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/25/20.
//

import SwiftUI

struct OrderCell: View {
    var order: Marketplace_Order = Marketplace_Order()
    var body: some View {
        VStack (alignment: .trailing, spacing: 0) {
            HStack {
                OrgLabel(orgName: order.sellerID)
                Spacer()
                switch order.status {
                    case Marketplace_OrderStatus.pendingPayment:
                        PaymentStatusTag.STATUS_PENDING
                    case Marketplace_OrderStatus.paymentConfirmed:
                        PaymentStatusTag.STATUS_CONFIRMED
                    default:
                        PaymentStatusTag.STATUS_ERROR
                }
            }.padding()
            ExDivider(color: Color(hex: 0xe0a6b5), width: 1)
            VStack {
                ForEach(0..<2) { i in
                    CartViewItemCell(isCancelable: false)
                }
            }
//            Divider().padding(.horizontal)
            HStack (alignment: .bottom) {
                Text("Order #: \(order.orderID)")
                Spacer()
                Label {
                    Text(String.toCurrencyStr(balance: order.totalAmount) ?? "-")
                        .fontWeight(.semibold)
                        .foregroundColor(.red)
                } icon: {
                    Image(systemName: "dollarsign.circle.fill")
                        .foregroundColor(.yellow)
                }
            }.padding()
            Divider()
            NavigationLink(
                destination: OrderDetailView(order: order),
                label: {
                    NavButton(text: "Detail").padding()
                }).buttonStyle(PlainButtonStyle())
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

struct OrderCell_Previews: PreviewProvider {
    static var previews: some View {
        OrderCell()
    }
}
