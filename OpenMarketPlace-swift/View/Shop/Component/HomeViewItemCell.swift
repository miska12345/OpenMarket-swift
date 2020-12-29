//
//  HomeViewItemCell.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/18/20.
//

import SwiftUI

struct HomeViewItemCell: View {
    @Binding var showDetail: Bool
    var item : Item
    var imageName: String = "Item_PS5"
    var tag: RecommendedItemCellTag = RecommendedItemCellTag(text: "Free Shipping", color: .orange)
    var displayTag: Bool = true
    var coin: String = "DashCoin"
    var backgroundColor: Color = Color.white
    var heartSizeDenom: CGFloat = 16
    @ObservedObject var currentItem : ItemViewWrapper
    var body: some View {
        let h: CGFloat = 280
        Button(action: {
            print("Item Pressed")
            DispatchQueue.main.async {
                self.currentItem.update(v: ItemView(showDetail: self.$showDetail, item: item))
                self.showDetail = true
            }
        }) {
            VStack {
                ZStack (alignment: .topTrailing) {
                    Image(imageName)
                        .resizable()
                        .frame(height: h * 0.6, alignment: .center)
                        .scaledToFill()
                    
                    Button(action: {
                        print("Like")
                    }) {
                        Image(systemName: "heart.fill")
                            .resizable()
                            .frame(width: h / heartSizeDenom, height: h / heartSizeDenom, alignment: .center)
                            .foregroundColor(Color.white.opacity(0.9))
                            
                            .overlay(
                                Image(systemName: "heart")
                                    .resizable()
                                    .foregroundColor(Color.gray)
                            )
                    }.padding()
                }
                VStack (alignment: .leading, spacing: 0) {
                    Text(item.itemName)
                        .font(.system(size: 15))
                        .fontWeight(.semibold)
                        .fixedSize(horizontal: false, vertical: true)
                        .minimumScaleFactor(0.5)
                        .scaledToFit()
                        .foregroundColor(.black)
                        .lineLimit(2).padding(.bottom, 5)
                    
                    Tag(tagConfig: tag)
                    HStack {
                        let priceToShow = String.toCurrencyStr(balance: item.price, useSymbol: true)
                        Text(priceToShow ?? "-")
                            .font(.system(size: 18))
                            .scaledToFill()
                            .minimumScaleFactor(0.5)
                            .foregroundColor(.red)
                            .allowsTightening(true)
                        Spacer()
                        Text(self.coin)
                            .font(.system(size: 14))
                            .scaledToFill()
                            .minimumScaleFactor(0.5)
                            .lineLimit(1)
                            .foregroundColor(.gray)
                            .padding(.top, 5)
                    }
                    .padding(.top, 10)
                    .padding(.bottom)
                }.padding(.horizontal)
            }
            .background(
                Color.white
            )
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(radius: 1)
        }
    }
    struct Tag: View {
        var tagConfig: RecommendedItemCellTag = RecommendedItemCellTag()
        var body: some View {
            ZStack {
                Text(tagConfig.text)
                    .font(.system(size: 14))
                    .minimumScaleFactor(0.5)
                    .scaledToFill()
                    .foregroundColor(tagConfig.color)
                    .padding(.horizontal, 5)
            }.background(
                RoundedRectangle(cornerRadius: 3)
                    .stroke(tagConfig.color, lineWidth: 1)
            )
        }
    }
}

struct RecommendedItemCellTag {
    var text: String = "Tag"
    var color: Color = Color.black
}

//struct HomeViewItemCell_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeViewItemCell(showDetail: Binding(get: {
//            return true
//        }, set: { (_) in
//        }))
//    }
//}
