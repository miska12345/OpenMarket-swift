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
            HomeView(data: staticData, recommend: org)
                .tabItem {
                    Image(systemName: "1.square.fill")
                    Text("Home")
                }
            CartView().environmentObject(CartManager.shared)
                .tabItem {
                    Image(systemName: "2.square.fill")
                    Text("Cart")
                }
            ProfileView(usernmae: "apple")
                .tabItem {
                    Image(systemName: "3.square.fill")
                    Text("Profile}")
                }
            EventView(session: session)
                .tabItem {
                    Image(systemName: "4.square.fill")
                    Text("Event")
                }
            WalletView(session: session)
                .tabItem {
                    Image(systemName: "5.square.fill")
                    Text("Event")
                }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(session: SessionManager())
    }
}
