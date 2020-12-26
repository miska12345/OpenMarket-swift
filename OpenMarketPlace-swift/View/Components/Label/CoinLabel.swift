//
//  CoinLabel.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/24/20.
//

import SwiftUI

struct CoinLabel: View {
    var icon: String = ""
    var name: String = "BitCoin"
    var body: some View {
        Label {
            Text("BitCoin")
        } icon: {
            Image(systemName: "dollarsign.circle.fill")
                .foregroundColor(.yellow)
        }
    }
}

struct CoinLabel_Previews: PreviewProvider {
    static var previews: some View {
        CoinLabel()
    }
}
