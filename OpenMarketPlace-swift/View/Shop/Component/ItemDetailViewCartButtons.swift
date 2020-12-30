//
//  ItemDetailViewShopButtons.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/19/20.
//

import SwiftUI

struct ItemDetailViewCartButtons: View {
    var size: CGFloat = 50
    let currentItem: Item
    let orgName: String
    @EnvironmentObject var session : SessionManager
    var body: some View {
        HStack {
            cartButton().padding(.trailing)
            Spacer()
            addToCartButton()
        }
    }
    
    func addToCartButton() -> some View {
        Button(action: {
            session.cartManager?.addItemToCart(newItem: self.currentItem, orgName: self.orgName, quanity: 1)
        }) {
            RoundedRectangle(cornerRadius: 25)
                .foregroundColor(AppColors.primaryColor)
                .frame(height: self.size)
                .shadow(color: .gray, radius: 1, x: 0, y: 0)
                .overlay(Text("Add to Cart")
                            .foregroundColor(.white)
                            .bold())
        }
    }
    
    func cartButton() -> some View {
        Button(action: {
            
        }) {
            ZStack {
                Image(systemName: "cart.fill")
                    .resizable()
                    .frame(width: self.size / 2, height: self.size / 2, alignment: .center)
                    .foregroundColor(.white)
            }
            .frame(width: self.size, height: self.size, alignment: .center)
            .background(
                Circle()
                    .shadow(color: .gray, radius: 1, x: 0.0, y: 0.0)
                    .foregroundColor(AppColors.primaryColor)
            )
        }
    }
}

struct ItemDetailViewShopButtons_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailViewCartButtons(currentItem: Item(id: 1, itemName: "name", price: 20.0, itemDescription: "", orderQuantity: 0, stock: 0, category: "", owner: ""), orgName: "arasaka")
    }
}
