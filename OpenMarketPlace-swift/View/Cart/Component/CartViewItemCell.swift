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
    @ObservedObject var item : Item = Item(id: 1, itemName: "PS5", price: 300.0, itemDescription: "Brand New PS5", orderQuantity: 100, stock: 100, category: "electronic", owner: "arasaka")
    @EnvironmentObject var session: SessionManager
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
                        Text(item.itemName)
                            .lineLimit(2)
                            .minimumScaleFactor(0.5)
                            .font(.system(size: 16))
                        Spacer()
                        if isCancelable {
                            Button(action: {
                                session.cartManager?.carts[self.item.owner]?.removeItem(with: self.item)
                                if (self.session.cartManager?.carts[self.item.owner]?.items.count == 0) {
                                    self.session.cartManager?.deleteCart(orgName: self.item.owner)
                                }
                            }) {
                                Image(systemName: "xmark")
                                    .foregroundColor(.gray)
                                    .padding(.leading)
                            }
                        }
                    }
                    Spacer()
                    HStack (alignment: .bottom) {
                        Text(String.toCurrencyStr(balance: item.price, useSymbol: true)!)
                            .fontWeight(.semibold)
                        Spacer()
                        if isQuantityChangable {
                            ItemViewQuantityPicker(quantity: UInt(self.item.orderQuantity), performUponIncreament: { (amount: Int) in
                                print("item quanity: " + String(item.orderQuantity));
                                item.orderQuantity += amount
                                self.session.cartManager?.carts[self.item.owner]?.updateSubtotal()
                            }, performUponDecreament: { (amount: Int) in
                                item.orderQuantity = max(0, item.orderQuantity - amount);
                                if (item.orderQuantity == 0) {
                                    session.cartManager?.carts[self.item.owner]?.removeItem(with: self.item)
                                }
                                
                                if (self.session.cartManager?.carts[self.item.owner]?.items.count == 0) {
                                    self.session.cartManager?.deleteCart(orgName: self.item.owner)
                                    return;
                                }
                                self.session.cartManager?.carts[self.item.owner]?.updateSubtotal()
                                
                            })
                                .frame(width: 110)
                        } else {
                            if isOutOfStock {
                                Text("Out of Stock")
                                    .foregroundColor(.red)
                            } else {
                                Text(String(item.orderQuantity))
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
        CartViewItemCell(isQuantityChangable: true, item: Item(id: 1, itemName: "ps6", price: 21.12312, itemDescription: "Brand new ps6 get it now", orderQuantity: 10, stock: 20, category: "casdf", owner: "sdfjaslkdf"))
    }
}
