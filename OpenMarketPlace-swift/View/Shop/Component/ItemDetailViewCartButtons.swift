//
//  ItemDetailViewShopButtons.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/19/20.
//

import SwiftUI

struct ItemDetailViewCartButtons: View {
    var size: CGFloat = 50
    var body: some View {
        HStack {
            cartButton().padding(.trailing)
            Spacer()
            addToCartButton()
        }
    }
    
    func addToCartButton() -> some View {
        Button(action: {
            print("Add to cart")
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
            print("Round Action")
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
        ItemDetailViewCartButtons()
    }
}
