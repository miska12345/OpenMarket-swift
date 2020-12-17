//
//  CurrencyPickerItem.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/15/20.
//

import SwiftUI

struct CurrencyPickerItem: View {
    @Binding var currentCoinSelected: String
    @Binding var disclosureGroupEnabled: Bool
    var backgroundColor = Color.yellow
    var currency = ""
    var amount = 0.0
    var body: some View {
        Button(action: {
            currentCoinSelected = currency
            disclosureGroupEnabled = false
        }) {
            RoundedRectangle(cornerRadius: 5)
                .foregroundColor(backgroundColor)
                .frame(height: 50)
                .shadow(color: .gray, radius: 2, x: 0, y: 0)
                .overlay(
                    HStack {
                        Text(currency)
                            .bold()
                            .foregroundColor(.white)
                            .padding(.leading)
                        Spacer()
                        Text("$").foregroundColor(.white)
                        Text(String(amount))
                            .bold()
                            .foregroundColor(.white)
                            .padding(.trailing)
                    })
                    
        }.padding(.horizontal)
        .padding(.bottom, 10)
    }
}

struct CurrencyPickerItem_Previews: PreviewProvider {
    static var previews: some View {
        Prev_Struct()
    }
}

struct Prev_Struct: View {
    @State var string = ""
    @State var enabled = false
    var body: some View {
        CurrencyPickerItem(currentCoinSelected: $string, disclosureGroupEnabled: $enabled, backgroundColor: Color.green, currency: "DashCoin", amount: 10.0)
    }
}
