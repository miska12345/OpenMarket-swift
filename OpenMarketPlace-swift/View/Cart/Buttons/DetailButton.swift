//
//  DetailButton.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 9/22/20.
//

import Foundation
import SwiftUI

struct DetailButton: View {
    let backgroundColor = Color.gray.opacity(0.1)
    @EnvironmentObject var manager: CartManager
    let cart: Cart
    @State var enable = false
    var body: some View {
        Button(action: {
            self.enable = true
        }) {
            RoundedRectangle(cornerRadius: 5)
                .foregroundColor(self.backgroundColor)
                .border(Color.gray, width: 1)
                .frame(height: 80)
                .overlay(
                    NavigationLink(destination: DetailView(session: manager.session, cart: cart).environmentObject(manager), isActive: $enable) {
                        Image("iTunesArtwork").resizable().aspectRatio(1, contentMode: .fit)
                            .frame(width: 60, height: 60)
                    }.padding()
                )
        }
    }
}
