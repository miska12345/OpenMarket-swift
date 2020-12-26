//
//  CartViewItemCell.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/19/20.
//

import SwiftUI

struct CartViewItemCell: View {
    var isQuantityChangable: Bool = false
    var isCancelable: Bool = true
    var isOutOfStock: Bool = false
    var backgroundColor: Color = Color.white
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
//                .padding(.leading, 20)
            Spacer()
            ZStack (alignment: .bottom) {
                VStack (alignment: .leading) {
                    HStack (alignment: .top) {
                        Text("Brand New PS5 Get It NOW for free")
                            .lineLimit(2)
                            .minimumScaleFactor(0.5)
                            .font(.system(size: 16))
                        Spacer()
                        if isCancelable {
                            Button(action: {
                                print("Delete item pressed")
                            }) {
                                Image(systemName: "xmark")
                                    .foregroundColor(.gray)
                                    .padding(.leading)
                            }
                        }
                    }
                    Spacer()
                    HStack (alignment: .bottom) {
                        Text("$300")
                            .fontWeight(.semibold)
                        Spacer()
                        if isQuantityChangable {
                            ItemViewQuantityPicker()
                                .frame(width: 110)
                        } else {
                            if isOutOfStock {
                                Text("Out of Stock")
                                    .foregroundColor(.red)
                            } else {
                                Text("20")
                                    .frame(minWidth: 50, minHeight: 40)
                                    .background(AppColors.lightGray)
                                    
                                    .clipShape(RoundedRectangle(cornerRadius: 10, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
                            }
                        }
                    }
                }.padding(.vertical, 10)
//                .padding(.trailing, 20)
                ExDivider(color: AppColors.lightGray2, width: 1)
            }
        }
        .padding(.horizontal, 20)
        .frame(maxHeight: 125)
        .background(
            backgroundColor
        )
//        .padding(.leading, 20)
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
