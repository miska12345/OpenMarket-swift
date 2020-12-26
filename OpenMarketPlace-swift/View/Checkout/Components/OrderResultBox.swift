//
//  OrderResultBox.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/25/20.
//

import SwiftUI

struct OrderResultBox: View {
    @State var showUnavailableItem = false
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            HStack (alignment: .top) {
                Label {
                    Text("Organization of Bubble Tea(2)")
                        .fontWeight(.semibold)
                        .lineLimit(1)
                } icon: {
                    Image(systemName: "gamecontroller.fill")
                        .foregroundColor(.white)
                        .background(
                            AppColors.secondaryColor
                        )
                        .clipShape(Circle())
                }
                Spacer()
            }.padding()
            ExDivider(color: Color(hex: 0xe0a6b5), width: 1)
            VStack {
                ForEach(0..<2) { _ in
                    CartViewItemCell(isQuantityChangable: false, isCancelable: false)
                }
            }
            Divider().padding(.horizontal)
            
            HStack {
                Text("Unavailable Items (2)")
                Spacer()
                Image(systemName: "chevron.right")
            }.padding()
            .onTapGesture {
                print("Show unavailable")
                self.showUnavailableItem = true
            }
            
            Divider().padding(.horizontal)
            
            VStack {
                HStack (alignment: .bottom) {
                    Text("Total")
                    Spacer()
                    Label {
                        Text("200")
                    } icon: {
                        Image(systemName: "dollarsign.circle.fill")
                            .foregroundColor(.yellow)
                    }
                }.padding(.bottom)
                .onTapGesture {
                    print("Show unavailable items")
                }
                
                HStack (alignment: .bottom) {
                    Text("Order #")
                    Spacer()
                    Text("12312-12312-124123-213213")
                        .foregroundColor(AppColors.secondaryColor)
                }
            }.padding()
            
        }
        .background(
            Color.white
        )
        .clipShape(
            RoundedRectangle(cornerRadius: 15)
        )
        .shadow(color: .gray, radius: 1, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
        .sheet(isPresented: $showUnavailableItem, content: {
            FailedItemView(showUnavailableItem: $showUnavailableItem)
        })
    }
}

struct OrderResultBox_Previews: PreviewProvider {
    static var previews: some View {
        OrderResultBox()
    }
}
