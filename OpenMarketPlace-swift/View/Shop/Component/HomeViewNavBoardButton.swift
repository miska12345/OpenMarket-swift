//
//  HomeViewNavBoardButton.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/18/20.
//

import SwiftUI

struct HomeViewNavBoardButton: View {
    var iconName: String = "dollar"
    var text: String = "Trending"
    var body: some View {
        NavigationLink(destination: EmptyView(),
                       label: {
                        VStack(spacing: 5) {
                            ZStack {
//                                Color(hex: 0xcccccc)
                                Image(iconName).resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .padding(10)
                                
                            }
//                            .clipShape(Circle())
//                            .shadow(color: .gray, radius: 1, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                            .frame(width: 60, height: 60, alignment: .center)
                            Text(text)
                                .font(.body)
                                .foregroundColor(.black)
                        }
                       }
        ).buttonStyle(PlainButtonStyle())
    }
}

struct HomeViewNavBoardButton_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewNavBoardButton()
    }
}
