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
    let itemFontColor = Color(hex: 0x2c3e50)
    @State var sheetEnable: Bool = false
    @State var outOfStock: [Item] = [Item]()
    @State var checkoutMessage: String = ""
    var body: some View {
        VStack {
            createIcon()
            createCheckoutList()
            createTotalLabel()
            createPayButton()
        }
        .sheet(isPresented: self.$sheetEnable) {
            CheckOutSubView(unprocessed: self.$outOfStock, checkoutMesssge: self.$checkoutMessage, showSheet: $sheetEnable)
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
                    Text("Quantity: \(item.orderQuantity)")
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
        
        GeneralButton(title: "PAY NOW", perform: {
            var checkoutItems = [Marketplace_ItemGrpc]()
            for item in self.cart.items{
                checkoutItems.append(convertToItemGrpc(item: item))
            }
            
            manager.session.marketplaceManager?.checkout(items: checkoutItems, orgId: self.cart.shopName, currencyId: self.cart.id) {unprocessed, error in
                self.checkoutMessage = (error.message)!
                if (unprocessed != nil) {
                    for index in 0...(unprocessed!.count - 1) {
                        let itemgrpc: Marketplace_ItemGrpc = unprocessed![index]

                        self.outOfStock.append(Item(id: itemgrpc.itemID, itemName: itemgrpc.itemName, price: itemgrpc.itemPrice, description: "", orderQuantity: Int(itemgrpc.itemCount), stock: 0, category: "", owner: itemgrpc.belongTo))
                    }
                }
                self.sheetEnable = true
            }
        }).padding()
    }
    
    func convertToItemGrpc(item : Item) -> Marketplace_ItemGrpc {
        var itemgrpc = Marketplace_ItemGrpc()
        itemgrpc.itemID = item.id
        itemgrpc.itemName = item.itemName
        itemgrpc.itemPrice = item.price
        itemgrpc.itemCount = Int32(item.orderQuantity)
        itemgrpc.belongTo = item.owner
        
        return itemgrpc
    }
}

//struct CheckoutView_Previews: PreviewProvider {
//    static var previews: some View {
//        CheckoutView(cart: previewCart)
//    }
//}

let previewCart = Cart(id: "1", shopName: "AAA", items: [])

//
//let previewCart = Cart(id: "1", shopName: "AAA", items: [
//    Item(id: "1", itemName: "MAcbook pro super long name bla bla bnla bla bla", price: 5.32, description: "Pickup at my house", quantity: 3),
//    Item(id: "2", itemName: "Great banana", price: 5.32, description: "Pickup at my house", quantity: 2)
//])
