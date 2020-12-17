//
//  WalletCoinCell.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/16/20.
//

import SwiftUI

struct WalletCoinCell: View {
    var coin: String = "BitCoin"
    var amount: Double = 10.0
    var iconName: String = "dollarsign.circle.fill"
    var iconColor: Color = .yellow
    var body: some View {
        ZStack {
            DisclosureGroup (
                isExpanded: .constant(false),
                content: { Text("Content") },
                label: {
                    Button(action: {
                        print("\(coin) clicked")
                    }) {
                        HStack {
                            Image(systemName: iconName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(iconColor)
                                .frame(width: 50, height: 50, alignment: .center)
                            VStack (alignment: .leading) {
                                Text(coin).bold().foregroundColor(.black)
                                Text(String.toCurrencyStr(balance: amount, useSymbol: true) ?? "0").foregroundColor(.gray)
                            }.padding(5)
                            Spacer()
                        }
                    }
                    
                }).padding()
        }
        .background (
            RoundedRectangle(cornerRadius: 5)
                .foregroundColor(.white)
                .frame(height: 100)
                .shadow(color: .gray, radius: 2, x: 0, y: 0)
        )
    }
}

struct WalletCoinCell_Previews: PreviewProvider {
    static var previews: some View {
        WalletCoinCell()
    }
}
