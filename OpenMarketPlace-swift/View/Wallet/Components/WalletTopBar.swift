//
//  WalletTopBar.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/17/20.
//

import SwiftUI

struct WalletTopBar: View {
    var welcomeMsgColor: Color = Color.black
    var username: String = "miska"
    var body: some View {
        HStack {
            Text("Hello, \(username)!").foregroundColor(welcomeMsgColor).font(.system(size: 30, weight: .bold))
            Spacer()
            Image("DefaultAvatar_Male")
                .resizable()
                .aspectRatio(contentMode: .fit
                )
                .foregroundColor(.black)
                .clipShape(Circle())
                .frame(width: 40, height: 40, alignment: .center)
        }
    }
}

struct WalletTopBar_Previews: PreviewProvider {
    static var previews: some View {
        WalletTopBar()
    }
}
