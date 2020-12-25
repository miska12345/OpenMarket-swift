//
//  ItemView.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/19/20.
//

import SwiftUI

struct ItemView: View {
    @Binding var showDetail: Bool
    //var itemName: String = "Best goat meat for BBQ"
    var item : Newsfeed_ItemGrpc
    var body: some View {
        NavigationView {
            GeometryReader() { geo in
                ZStack (alignment: .bottom) {
                    VStack (alignment: .leading) {
                        GeneralBackButton(text: item.itemName, action: {
                            self.showDetail = false
                        }, dismissable: false)
                            .padding(.horizontal)
                            .padding(.top)
                            .background(Color.white)
                        ScrollView() {
                            VStack(alignment: .center) {
                                Group {
                                    HomeViewSlider()
                                        .frame(height: 200)
                                    ItemDetailViewInfo(item: self.item)
                                }.padding()
                                ExDivider(color: AppColors.lightGray, width: 10)
                                
                                ItemDetailViewDetailBox(itemDescription: item.itemDescription).padding(.horizontal)
                            }
                        }.frame(width: geo.size.width)
                    }
                    ItemDetailViewCartButtons().padding(.horizontal)
                }
            }
            .navigationBarTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
        }
    }
}

class ItemViewWrapper: ObservableObject {
    @Published var shownDetailedItem: ItemView = ItemView(
        showDetail: Binding(get: {return false}, set: {(_) in}),
        item: {() -> Newsfeed_ItemGrpc in
            var temp = Newsfeed_ItemGrpc()
            temp.itemName = "ABC"
            return temp
        }())
    
    func update(v: ItemView) {
        self.shownDetailedItem = v
    }
}

//struct ItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        ItemView(showDetail: Binding(get: {
//            return true
//        }, set: { (_) in
//        }), item: {() -> {
//
//        }})
//    }
//}
