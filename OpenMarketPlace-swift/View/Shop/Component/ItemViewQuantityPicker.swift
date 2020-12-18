//
//  ItemViewQuantityPicker.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/17/20.
//

import SwiftUI

struct ItemViewQuantityPicker: View {
    @State var quantity: UInt = 10
    var body: some View {
        HStack {
            if quantity > 0 {
                if isLastItem() {
                    ItemViewButton(iconName: "trash.fill") {
                        decrementQuantity()
                    }
                } else {
                    ItemViewButton(iconName: "minus") {
                        decrementQuantity()
                    }
                }
                Spacer()
                Text("\(quantity)")
                    .padding(.horizontal, 5)
                Spacer()
            }
            ItemViewButton(iconName: "plus") {
                incrementQuantity()
            }
        }
    }
    
    func incrementQuantity() {
        self.quantity += 1
    }
    
    func decrementQuantity() {
        self.quantity -= 1
    }
    
    func isLastItem() -> Bool {
        return self.quantity == 1
    }
}

struct ItemViewQuantityPicker_Previews: PreviewProvider {
    static var previews: some View {
        ItemViewQuantityPicker()
    }
}
