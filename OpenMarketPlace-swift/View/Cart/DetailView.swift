//
//  DetailView.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 9/21/20.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var manager: CartManager
    @ObservedObject var cart: Cart
    var body: some View {
        ScrollView {
            VStack {
                DetailHeader(cart: cart)
                ForEach(cart.items, id: \.self) { item in
                    DetailItem(item: item, quantity: item.quantity).environmentObject(cart).environmentObject(manager)
                    Divider().padding()
                }
            }
        }
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
////        DetailView(cart: [Cart]())
//    }
//}

struct DetailHeader: View {
    @ObservedObject var cart: Cart
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        VStack() {
            Description(shopName: cart.shopName, itemCount: cart.items.count, subtotal: cart.subtotal).padding(.top, 10)
            CheckoutButton(cart: cart, shopName: cart.shopName).padding(EdgeInsets(top: 2, leading: 10, bottom: 0, trailing: 10))
            Divider().padding(.top, 10)
            ContinueToShopButton(shopName: cart.shopName).padding(.top, 3)
            Divider().padding(.top, 3)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle(Text("Detail"), displayMode: .inline)
        .navigationBarItems(
            leading:
                Button(action: {
                    print("dismiss")
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "arrow.left")
                },
            trailing:
                Button(action: {
                    print("search")
                }) {
                    Image(systemName: "magnifyingglass")
                }
        )
    }
}

struct DetailItem: View {
    @EnvironmentObject var manager: CartManager
    @EnvironmentObject var cart: Cart
    var item: Item
    @State var quantity: Int
    
    var controlButtonBgColor = Color.white
    
    var body: some View {
        VStack {
            createContentView()
            createControlView()
        }
    }
    
    func createControlButton(title: String, action: @escaping ()->()) -> some View {
        CartButton(title: title, backgroundColor: self.controlButtonBgColor, height: 40, perform: action)
    }
    
    func createContentView() -> some View {
        Button(action: {
            print("[TODO] show item detail")
        }) {
            HStack() {
                Image("iTunesArtwork")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .padding(.leading, 10)
                VStack(alignment: .leading) {
                    Text(item.itemName)
                        .font(.system(size: 18.0))
                        .bold()
                        .frame(minWidth: 100, maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color.black)
                        .lineLimit(2)
                    Text("$\(String(format: "%0.2f", item.price))").foregroundColor(.red)
                    Text("Quantity: \(String(quantity))")
                    Text(item.description).foregroundColor(.gray).lineLimit(1)
                }.padding()
            }.frame(maxWidth: .infinity)
            .background(Color.white)
        }
    }
    
    func createControlView() -> some View {
        HStack(alignment: .top, spacing: 10) {
            Stepper(value: $quantity, in: 1...10, onEditingChanged: { didChange in
                cart.onQuantityDidChanged(for: item, q: quantity)
            }) {
            }.padding(.trailing, 15)
            createControlButton(title: "Delete", action: {
                self.cart.onDeleteItemTapped(for: item)
                self.manager.onDeleteCartTapped(for: cart)
            })
            createControlButton(title: "Save for Later", action: {
                print("save")
            })
            Spacer()
        }
    }
}

let cart = [Cart]()
//let cart = Cart(id: "1", shopName: "UW", items: [
//    Item(id: "1", itemName: "MAcbook pro super long name bla bla bnla bla bla", price: 5.32, description: "Pickup at my house", quantity: 3),
//    Item(id: "2", itemName: "A super long description that is blablbba good", price: 5.32, description: "Pickup at my house", quantity: 3),
//    Item(id: "3", itemName: "MAcbook pro super long name bla bla bnla bla bla", price: 5.32, description: "Pickup at my house", quantity: 3),
//])
