//
//  CartViewItemCell.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/19/20.
//

import SwiftUI

struct CartViewItemCell: View {
    var body: some View {
        HStack (alignment: .top, spacing: 0) {
            Image("Item_PS5")
                .resizable()
                .frame(maxWidth: 125, maxHeight: 125)
                .scaledToFit()
                .clipShape(
                    RoundedRectangle(cornerRadius: 10)
                )
                .padding(.vertical, 10)
            Spacer()
            ZStack (alignment: .bottom) {
                VStack (alignment: .leading) {
                    HStack (alignment: .top) {
                        Text("Brand New PS5 Get It NOW for free")
                            .lineLimit(2)
                            .minimumScaleFactor(0.5)
                            .font(.system(size: 16))
                        Spacer()
                        Button(action: {
                            print("Delete item pressed")
                        }) {
                            Image(systemName: "xmark")
                                .foregroundColor(.gray)
                                .padding(.leading)
                        }
                    }
                    Spacer()
                    HStack (alignment: .bottom) {
                        Text("$300")
                            .fontWeight(.semibold)
                        Spacer()
                        ItemViewQuantityPicker()
                            .frame(width: 110)
                    }
                }.padding(.vertical, 10)
                .padding(.trailing, 20)
                ExDivider(color: AppColors.lightGray2, width: 1)
            }
        }
        .frame(maxHeight: 125)
        .background(
            Color.white
        )
        .padding(.leading, 20)
        .onTapGesture {
            print("Item tapped")
        }
    }
}

struct CartViewItemCell_Previews: PreviewProvider {
    static var previews: some View {
        CartViewItemCell()
    }
}
