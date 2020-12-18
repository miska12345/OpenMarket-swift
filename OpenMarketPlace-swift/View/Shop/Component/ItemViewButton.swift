//
//  ItemViewPlusButton.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/17/20.
//

import SwiftUI

struct ItemViewButton: View {
    var iconName: String = "plus"
    var perform: ()->() = {}
    var body: some View {
        Button(action: {
                    print("Round Action")
            perform()
                    }) {
            Image(systemName: iconName)
                .resizable().padding(8)
                .frame(width: 35, height: 35)
                .foregroundColor(Color.white)
                .background(AppColors.primaryColor)
                .clipShape(Circle())
                }
    }
}

struct ItemViewPlusButton_Previews: PreviewProvider {
    static var previews: some View {
        ItemViewButton()
    }
}
