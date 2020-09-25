//
//  CartView.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 9/21/20.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var manager: CartManager
    var body: some View {
        NavigationView {
            buildCartView
            .navigationBarTitle("Carts")
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear(perform: {
            manager.fetchData()
        })
    }
    
    @ViewBuilder
    var buildCartView: some View {
        if manager.carts.count == 0 {
            emptyCartView
        } else {
            listCartView
        }
    }
    
    var emptyCartView: some View {
        VStack {
            HStack {
                Image(systemName: "paperplane.fill")
                Text("You have not added anything yet")
            }
            CartButton(title: "Go Shop Shop", perform: {
                print("shop")
            }).padding()
        }
        
    }
    
    var listCartView: some View {
        List(manager.carts) { cart in
            CartItem(cart: cart).environmentObject(manager)
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView().environmentObject(CartManager.shared)
            .previewDevice("iPhone 11")
    }
}

struct CartItem: View {
    @EnvironmentObject var manager: CartManager
    @ObservedObject var cart: Cart
    var body: some View {
        VStack(alignment: .center) {
            Description(shopName: cart.shopName, itemCount: cart.items.count, subtotal: cart.subtotal)
            CheckoutButton(cart: cart, shopName: cart.shopName).environmentObject(manager)
            DetailButton(cart: cart).padding(.top, 10).environmentObject(manager)
            ContinueToShopButton(shopName: cart.shopName)
            Spacer()
        }.buttonStyle(PlainButtonStyle())
    }
}

struct Description: View {
    let shopName: String
    let itemCount: Int
    let subtotal: Double
    var fontColor = Color.black
    var body: some View {
        HStack {
            Text("\(shopName) Subtotal(\(String(itemCount)) items):")
                .font(.system(size: 17))
                .foregroundColor(self.fontColor)
            Text("$\(String(format: "%.2f", subtotal))").foregroundColor(Color.red).bold()
        }
    }
}
