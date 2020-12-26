//
//  OrderCell.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/25/20.
//

import SwiftUI

struct OrderCell: View {
    var body: some View {
        VStack (alignment: .trailing, spacing: 0) {
            HStack (alignment: .top) {
                OrgLabel()
                Spacer()
                PaymentStatusTag()
            }.padding()
            ExDivider(color: Color(hex: 0xe0a6b5), width: 1)
            VStack {
                ForEach(0..<2) { _ in
                    CartViewItemCell(isCancelable: false)
                }
            }
//            Divider().padding(.horizontal)
            HStack (alignment: .bottom) {
                Text("Order #: 12345567")
                Spacer()
                Label {
                    Text("200")
                        .fontWeight(.semibold)
                        .foregroundColor(.red)
                } icon: {
                    Image(systemName: "dollarsign.circle.fill")
                        .foregroundColor(.yellow)
                }
            }.padding()
            Divider()
            NavButton(text: "Detail").padding()
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
