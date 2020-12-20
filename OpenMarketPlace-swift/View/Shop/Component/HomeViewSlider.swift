//
//  HomeViewSlider.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/17/20.
//

import SwiftUI

struct HomeViewSlider: View {
    var body: some View {
        GeometryReader() { geo in
            LazyHStack(spacing: 0) {
                TabView {
                    ForEach(0..<5) {i in
                        ZStack {
                            Image("Poster_PS5")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .frame(width: geo.size.width, height: geo.size.height)
                .clipShape(
                    RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                )
            }
            .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
        }
    }
}

struct HomeViewSlider_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewSlider()
    }
}
