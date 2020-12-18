//
//  HomePageSearchBar.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/17/20.
//

import SwiftUI

struct HomePageSearchBar: View {
    var body: some View {
        HStack {
            Image (systemName: "dollarsign.circle").resizable().aspectRatio(contentMode: .fit).foregroundColor(.yellow).frame(width: 30, height: 30, alignment: .center)
            HomePageSearchTextField().padding(.horizontal, 5)
            Image (systemName: "cart.fill").resizable().aspectRatio(contentMode: .fit).foregroundColor(.white).frame(width: 30, height: 30, alignment: .center)
        }
    }
}

struct HomePageSearchBar_Previews: PreviewProvider {
    static var previews: some View {
        HomePageSearchBar()
    }
}
