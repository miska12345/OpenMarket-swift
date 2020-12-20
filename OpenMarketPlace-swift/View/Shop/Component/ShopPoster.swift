//
//  ShopPoster.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/17/20.
//

import SwiftUI

struct ShopPoster: View {
    var body: some View {
        ZStack {
            Image("test1")
                .resizable()
            VStack {
                GeometryReader() { geo in
                    Button(action: {
                        print("Top Clicked")
                    }) {
                        Text("")
                            .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                    }
                }

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack (spacing: 20) {
                        ForEach(0..<5) { _ in
                            PosterItemContainer()
                        }
                    }.padding()
                }
            }
        }
        .clipShape(
            RoundedRectangle(cornerRadius: 10)
        )
        .frame(height: 495, alignment: .center)
    }
}

struct ShopPoster_Previews: PreviewProvider {
    static var previews: some View {
        ShopPoster()
    }
}
