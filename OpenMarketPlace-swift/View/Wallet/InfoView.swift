//
//  InfoView.swift
//  WalletAppExploration
//
//  Created by Raphael Cerqueira on 17/08/20.
//  Copyright © 2020 ShangJin All rights reserved.
//

import SwiftUI

struct InfoView: View {
    @Binding var items: [Transaction_QueryResultItem]
    var isShowingPaid: Bool
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    ForEach(items, id: \.self) { item in
                        RowView(item: item, isShowingPaid: isShowingPaid)
                    }
                }
            }
        }
        .padding()
        .cornerRadius(40)
    }
}

//struct InfoView_Previews: PreviewProvider {
//    @State var items =  [Transaction_QueryResultItem]()
//    static var previews: some View {
//        InfoView(items: $items)
//    }
//}

struct RowView: View {
    @State var item: Transaction_QueryResultItem
    var isShowingPaid: Bool
    var body: some View {
        VStack {
            HStack {
                ZStack {
                    Circle()
                        .frame(width: 70, height: 70)
                        .foregroundColor(Color.red.opacity(0.3))
                    
                    Text((self.isShowingPaid ? self.item.recipientID.prefix(2) : self.item.payerID.prefix(2)).uppercased())
                        .foregroundColor(.red)
                }
                
                VStack(alignment: .leading) {
                    Text(item.moneyAmount.currencyID)
                        .bold()
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    Text(item.note)

                        .foregroundColor(.gray)
                        .padding(.top, 8)
                        .lineLimit(2)
                }
                .padding(.leading)
                .padding(.trailing)
                
                Spacer()
                
                VStack {
                    HStack(spacing: 4) {
                        Text(item.payerID.elementsEqual(AuthManager.shared.currentUser!.username) ? "-" : "+")
                            .foregroundColor(item.payerID.elementsEqual(AuthManager.shared.currentUser!.username) ? Color(#colorLiteral(red: 0.8930629492, green: 0.4423119426, blue: 0.4597078562, alpha: 1)) : Color(#colorLiteral(red: 0.3912505507, green: 0.7258948088, blue: 0.3816880286, alpha: 1)))
                        Text("$\(String(format: "%.2f", item.moneyAmount.amount))")
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                    }
                    Text(String(describing: item.status)).foregroundColor(Color(hex: 0x2980b9))
                }
            }
            
            Divider().background(Color.gray)
                .padding(.vertical, 8)
        }
    }
}
