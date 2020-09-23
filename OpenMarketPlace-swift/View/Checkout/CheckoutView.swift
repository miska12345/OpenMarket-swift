//
//  CheckoutView.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 9/22/20.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var manager: CartManager
    var cart: Cart
    let iconColor = Color.red
    let itemFontColor = Color(0x2c3e50)
    
    var body: some View {
        VStack {
            createIcon()
            createCheckoutList()
            createTotalLabel()
            createPayButton()
        }
        .navigationBarTitle(Text("Checkout"), displayMode: .inline)
    }
    
    func createIcon() -> some View {
        VStack {
            Image(systemName: "cart").resizable().aspectRatio(contentMode: .fit).frame(width: 50, height: 50, alignment: .center).padding(.top)
            Text("Summary")
        }.foregroundColor(self.iconColor)
    }
    
    func createCheckoutList() -> some View {
        List(cart.items) { item in
            HStack {
                VStack(alignment: .leading) {
                    Text("\(item.itemName)").lineLimit(2)
                    Spacer()
                    Text("Quantity: \(item.quantity)")
                }.foregroundColor(self.itemFontColor)
                Spacer()
                Text("$\(item.getTotalPriceRounded())").bold()
            }
        }
        .buttonStyle(PlainButtonStyle())
        .padding()
        .shadow(radius: 5)
    }
    
    func createTotalLabel() -> some View {
        HStack {
            Text("TOTAL:")
            Text("$\(cart.getSubtotalRounded())").bold()
        }
    }
    
    func createPayButton() -> some View {
        CartButton(title: "PAY NOW", perform: {
            manager.onCheckoutTapped(for: cart)
        }).padding()
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(cart: previewCart)
    }
}

let previewCart = Cart(id: "1", shopName: "AAA", items: [
    Item(id: "1", itemName: "MAcbook pro super long name bla bla bnla bla bla", price: 5.32, description: "Pickup at my house", quantity: 3),
    Item(id: "2", itemName: "Great banana", price: 5.32, description: "Pickup at my house", quantity: 2)
])
