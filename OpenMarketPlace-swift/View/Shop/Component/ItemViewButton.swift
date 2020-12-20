//
//  ItemViewPlusButton.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/17/20.
//

import SwiftUI

struct ItemViewButton: View {
    var iconName: String = "plus"
    var isSysIcon: Bool = true
    var perform: ()->() = {}
    var body: some View {
        Button(action: {
            print("Round Action")
            perform()
        }) {
            let img = isSysIcon ? Image(systemName: iconName) : Image(iconName)
                img
                .resizable().padding(8)
                .frame(width: 30, height: 30)
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
