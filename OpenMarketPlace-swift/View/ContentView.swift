//
//  ContentView.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 9/21/20.
//

import SwiftUI

struct ContentView: View {
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
            LoginView()
                .tabItem {
                    Image(systemName: "3.square.fill")
                    Text("Login")
                }
            ProfileView(usernmae: "apple")
                .tabItem {
                    Image(systemName: "4.square.fill")
                    Text("Login")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
