//
//  ItemDetailViewInfo.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/19/20.
//

import SwiftUI

struct ItemDetailViewInfo: View {
    var body: some View {
        VStack (alignment: .leading) {
            HStack (alignment: .top) {
                Text("Best goat meat for BBQ well prepared cooking ready")
                    .font(.headline)
                    .minimumScaleFactor(0.5)
                    .lineLimit(2)
                Spacer()
                Image(systemName: "heart").resizable()
                    .frame(width: 20, height: 20, alignment: .center)
                    .scaledToFit()
                Image(systemName: "square.and.arrow.up").resizable()
                    .frame(width: 20, height: 20, alignment: .center)
                    .scaledToFit()
            }
            .padding(.bottom, 5)
            HStack (alignment: .bottom) {
                Text("$13")
                    .bold()
                    .font(.system(size: 35))
                    .minimumScaleFactor(0.5)
                    .foregroundColor(.red)
                    .scaledToFill()
//                Spacer()
                Text("DashCoin")
                    .foregroundColor(.gray)
//                    .padding(.top)
            }
        }
    }
}

struct ItemDetailViewInfo_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailViewInfo()
    }
}
