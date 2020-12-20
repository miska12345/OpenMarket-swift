//
//  HomeViewNavBoard.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/18/20.
//

import SwiftUI

struct HomeViewNavBoard: View {
    let icons = ["flame", "dollar"]
    var body: some View {
        
        VStack {
            ForEach(0..<2) { j in
                HStack (alignment: .center) {
                    ForEach(0..<4) {i in
                        HomeViewNavBoardButton(iconName: icons[i % 2], text: icons[i % 2])
                        if i != 3 {
                            Spacer()
                        }
                    }
                }.padding(.horizontal)
            }
        }
    }
}

struct HomeViewNavBoard_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewNavBoard()
    }
}
