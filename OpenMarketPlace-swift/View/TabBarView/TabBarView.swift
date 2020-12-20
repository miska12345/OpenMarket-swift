//
//  TabBarView.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 9/25/20.
//

import SwiftUI

struct TabBarView: View {
    @ObservedObject var session: SessionManager
    var body: some View {
        TabView {
            ShopView()
                .tabItem {
                    Image(systemName: "1.square.fill")
                    Text("Home")
                }
            NewCartView()
                .tabItem {
                    Image(systemName: "2.square.fill")
                    Text("Cart")
                }
            ShopView()
                .tabItem {
                    Image(systemName: "3.square.fill")
                    Text("Shop")
                }
            EventView(session: session)
                .tabItem {
                    Image(systemName: "4.square.fill")
                    Text("Event")
                }
            NewWalletView(session: session)
                .tabItem {
                    Image(systemName: "5.square.fill")
                    Text("Wallet")
                }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(session: SessionManager())
    }
}
