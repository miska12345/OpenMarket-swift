//
//  ItemContainer.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/17/20.
//

import SwiftUI

struct ItemContainer: View {
    var tag: String = "New"
    var body: some View {
        ZStack {
            Color.white
            VStack (spacing: 0) {
                Button(action: {
                    print("Container")
                }) {
                    VStack(alignment: .leading, spacing: 5) {
                        ZStack(alignment: .topLeading) {
                            Image("Item_PS5")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .clipShape(
                                RoundedRectangle(cornerRadius: 10)
                            )
                            Text(tag)
                                .bold()
                                .background(
                                    RoundedRectangle(cornerRadius: 25).frame(width: 50, height: 25, alignment: .center)
                                        .foregroundColor(.green)
                            )
                            .foregroundColor(.white)
                        }
                        Text("Brand New PS5 eqweqweeqweqweqw").fontWeight(.semibold).lineLimit(2)
                        Text("$100").font(.title).foregroundColor(.red).padding(.top, 5)
                        Spacer()
                    }
                    .padding(.top)
                    .padding(.horizontal)
                    .padding(.bottom, 5)
                }
//                ItemViewButton().padding(.bottom)
                ItemViewQuantityPicker()
                    .padding(.horizontal)
                    .padding(.bottom)
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 1)
        .frame(width: 150, height: 300, alignment: .center)
    }
}

struct ItemContainer_Previews: PreviewProvider {
    static var previews: some View {
        ItemContainer()
    }
}
