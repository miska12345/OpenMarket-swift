//
//  ItemViewQuantityPicker.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/17/20.
//

import SwiftUI

struct ItemViewQuantityPicker: View {
    var quantity: UInt = 1
    var performUponIncreament: ((_ amount: Int) -> Void)?
    var performUponDecreament: ((_ amount: Int) -> Void)?
    
    func doNoting(amount: Int) {
        print("do nothing")
    }
    var body: some View {
        HStack {
            if quantity > 0 {
                if isLastItem() {
                    ItemViewButton(iconName: "trash.fill") {
                        performUponDecreament!(Int(quantity))
                    }
                } else {
                    ItemViewButton(iconName: "minus") {
                        performUponDecreament!(1)
                    }
                }
                Spacer()
                Text("\(quantity)")
                    .padding(.horizontal, 5)
                Spacer()
            }
            ItemViewButton(iconName: "plus") {
                performUponIncreament!(1)
            }
        }
    }
    

    
    func isLastItem() -> Bool {
        return self.quantity == 1
    }
}
//
//struct ItemViewQuantityPicker_Previews: PreviewProvider {
//    static var previews: some View {
//        ItemViewQuantityPicker()
//    }
//}
