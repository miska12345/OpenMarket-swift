//
//  ShopView.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 9/21/20.
//

import SwiftUI

struct ShopView: View {
    var body: some View {
        ZStack {
            Color(hex: 0xf3f3f3).edgesIgnoringSafeArea(.all)
            VStack {
                HomePageSearchBar().padding()
                ScrollView {
                    VStack {
                        HomeViewSlider().padding(.horizontal)
                            .frame(height: 200, alignment: .center)
                        ForEach(0..<1) { _ in
                            ShopPoster().padding(.horizontal)
                        }
                    }

                }
            }
        }
    }
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView()
    }
}
