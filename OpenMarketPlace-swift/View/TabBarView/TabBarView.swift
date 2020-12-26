//
//  TabBarView.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 9/25/20.
//

import SwiftUI

struct TabBarView: View {
    @EnvironmentObject var session: SessionManager
    var body: some View {
        TabView {
            ShopView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            NewCartView()
                .tabItem {
                    Image(systemName: "cart.fill")
                    Text("Cart")
                }
            EventView(session: session)
                .tabItem {
                    Image(systemName: "gift.fill")
                    Text("Event")
                }
            ProfileView(session: _session)
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Account")
                }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
