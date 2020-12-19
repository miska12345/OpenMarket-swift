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
//            Image (systemName: "dollarsign.circle").resizable().aspectRatio(contentMode: .fit).foregroundColor(.yellow).frame(width: 30, height: 30, alignment: .center).shadow(color: .gray, radius: 1, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
//            Image ("pin").resizable().aspectRatio(contentMode: .fit).foregroundColor(AppColors.primaryColor).frame(width: 30, height: 30, alignment: .center)
//                .shadow(color: .gray, radius: 1, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
            HomePageSearchTextField().padding(.horizontal, 5)
            Image (systemName: "cart").resizable().aspectRatio(contentMode: .fit).foregroundColor(AppColors.primaryColor).frame(width: 30, height: 30, alignment: .center)
//                .shadow(color: .gray, radius: 1, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
        }
    }
}

struct HomePageSearchBar_Previews: PreviewProvider {
    static var previews: some View {
        HomePageSearchBar()
    }
}
