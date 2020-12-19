//
//  ItemContainer.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/17/20.
//

import SwiftUI

struct ItemContainer: View {
    var tag: String = "New"
    var imageName: String = "Item_PS5"
    var itemName: String = "Brand New PS5 4k Gaming Experience"
    var price: Double = 100.0
    var body: some View {
        ZStack {
            Color.white
            VStack (spacing: 0) {
                Button(action: {
                    print("Container")
                }) {
                    VStack(alignment: .leading, spacing: 5) {
                        ZStack(alignment: .topLeading) {
                            Image(imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .clipShape(
                                RoundedRectangle(cornerRadius: 10)
                            )
                            RoundedRectangle(cornerRadius: 8)
                                .foregroundColor(.green)
                                .frame(width: 50, height: 25, alignment: .center)
                                .padding(5)
                                .overlay(
                                    Text(tag).foregroundColor(.white).bold()
                                )
                        }
                        let priceToShow = String.toCurrencyStr(balance: price, useSymbol: true)
                        Text(itemName).fontWeight(.semibold).lineLimit(2)
                        Text(priceToShow ?? "-").font(.title).foregroundColor(.red).padding(.top, 5)
                        Spacer()
                    }
                    .padding(.top)
                    .padding(.horizontal)
                    .padding(.bottom, 5)
                }
//                ItemViewButton().padding(.bottom)
                ItemViewQuantityPicker()
                    .padding(.horizontal)
                    .padding(.bottom)
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 1)
        .frame(width: 150, height: 300, alignment: .center)
    }
}

struct ItemContainer_Previews: PreviewProvider {
    static var previews: some View {
        ItemContainer()
    }
}
