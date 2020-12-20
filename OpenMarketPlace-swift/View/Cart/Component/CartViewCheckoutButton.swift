//
//  CartViewCheckoutButton.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/19/20.
//

import SwiftUI

struct CartViewCheckoutButton: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .foregroundColor(AppColors.primaryColor)
            .frame(height: 50)
            .shadow(color: .gray, radius: 2, x: 0, y: 0)
            .overlay(
                Text("Check Out")
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
            )
            .onTapGesture(perform: {
                print("CheckOut La")
            })
    }
}

struct CartViewCheckoutButton_Previews: PreviewProvider {
    static var previews: some View {
        CartViewCheckoutButton()
    }
}
