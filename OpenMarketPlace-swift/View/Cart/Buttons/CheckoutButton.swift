////
////  CheckoutButton.swift
////  OpenMarketPlace-swift
////
////  Created by ShangJin Li on 9/22/20.
////
//
//import Foundation
//import SwiftUI
//
//struct CheckoutButton: View {
//    @EnvironmentObject var manager: CartManager
//    let cart: Cart
//    let shopName: String
//    @State var enable = false
//    var body: some View {
//        NavigationLink(destination: CheckoutView(cart: cart), isActive: $enable) {
//            EmptyView()
//        }
//        .frame(width: 0, height: 0)
//        .hidden()
//        .buttonStyle(PlainButtonStyle())
//        GeneralButton(title: "Checkout \(shopName) Cart", perform: {
//            self.enable = true
//        })
//    }
//}
