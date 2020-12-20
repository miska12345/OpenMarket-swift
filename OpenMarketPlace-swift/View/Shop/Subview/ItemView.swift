//
//  ItemView.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/19/20.
//

import SwiftUI

struct ItemView: View {
    @Binding var showDetail: Bool
    var itemName: String = "Best goat meat for BBQ"
    var body: some View {
        GeometryReader() { geo in
            ZStack (alignment: .bottom) {
                VStack (alignment: .leading) {
                    HStack {
                        Button(action: {
                            showDetail = false
                        }) {
                            Label {
                                Text(itemName)
                                    .fontWeight(.semibold)
                                    .lineLimit(1)
                            } icon: {
                                Image(systemName: "chevron.left")
                            }
                        }.buttonStyle(PlainButtonStyle())
                    }
                    .padding(.horizontal)
                    .padding(.top)
                    .background(
                        Color.white
                    )
                    
//                    Button(action: {
//                        print("x")
//                    }) {
//                        Image(systemName: "xmark.circle.fill")
//                            .resizable()
//                            .foregroundColor(.gray)
//                            .frame(width: 25, height: 25, alignment: .center)
//                    }.padding()
                    ScrollView() {
                        VStack(alignment: .center) {
                            Group {
                                HomeViewSlider()
                                    .frame(height: 200)
                                ItemDetailViewInfo()
                            }.padding()
                            ExDivider(color: AppColors.lightGray, width: 10)
                            
                            ItemDetailViewDetailBox().padding(.horizontal)
                        }
                    }.frame(width: geo.size.width)
                }
                ItemDetailViewCartButtons().padding(.horizontal)
            }
        }
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView(showDetail: Binding(get: {
            return true
        }, set: { (_) in
        }))
    }
}
