//
//  WalletToolBar.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/16/20.
//

import SwiftUI

struct WalletToolBar: View {
    var body: some View {
        HStack {
            ForEach(menuItems) { item in
                HStack {
                    Spacer(minLength: 0)
                    NavigationLink(destination: EmptyView(),
                                   label: {
                                    VStack {
                                        Image(systemName: item.image)
                                            .font(.title)
                                            .foregroundColor(.white)
                                            .frame(width: 60, height: 60)
                                            .background(item.backgroundColor)
                                            .cornerRadius(23)
                                                    
                                        Text(item.title)
                                            .foregroundColor(Color.primary.opacity(0.7))
                                            .padding(.top, 8)
                                        
                                    }
                                    
                                   }
                    )
                    Spacer(minLength: 0)
                    
                }
                
            }
        }
        .padding(.top, 30)
    }
}

struct WalletToolBar_Previews: PreviewProvider {
    static var previews: some View {
        WalletToolBar()
    }
}
