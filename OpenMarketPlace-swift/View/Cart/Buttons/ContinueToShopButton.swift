//
//  ContinueToShopButton.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 9/22/20.
//

import Foundation
import SwiftUI

struct ContinueToShopButton: View {
    let shopName: String
    @State var enable = false
    var body: some View {
        NavigationLink(destination: ShopView(), isActive: $enable) {
            EmptyView()
        }
        .frame(width: 0, height: 0)
        .hidden()
        .buttonStyle(PlainButtonStyle())
        Button(action: {
            self.enable = true
        }) {
            Text("Continue shopping on \(shopName) market").foregroundColor(.blue).font(.system(size: 15)).underline()
        }
    }
}
