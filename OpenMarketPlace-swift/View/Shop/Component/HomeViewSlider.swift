//
//  HomeViewSlider.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/17/20.
//

import SwiftUI

struct HomeViewSlider: View {
    var body: some View {
        //        ScrollView(.horizontal) {
        //            LazyHStack(spacing: 0) {
        //                ForEach(0..<5) {i in
        //                    ZStack {
        //                        Image("TestPoster1")
        //                            .resizable()
        //                            .aspectRatio(contentMode: .fill)
        //                            .frame(width: UIScreen.main.bounds.width, height: 200, alignment: .center)
        //                    }
        //                    .clipShape(
        //                        RoundedRectangle(cornerRadius: 10.0, style: .continuous))
        //                }
        //            }
        //        }
        
        GeometryReader() {geo in
            LazyHStack(spacing: 0) {
                TabView {
                    ForEach(0..<5) {i in
                        ZStack {
                            Image("TestPoster2")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .frame(width: geo.size.width, height: 200)
                .clipShape(
                    RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                )
            }.frame(width: geo.size.width, height: 200, alignment: .center)
            
        }
    }
}

struct HomeViewSlider_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewSlider()
    }
}
