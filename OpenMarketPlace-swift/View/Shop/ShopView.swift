//
//  ShopView.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 9/21/20.
//

import SwiftUI
import Grid

struct ShopView: View {
    @State var selection = 0
    @State var refreshing = false
    @State var firstAppear = false
    @ObservedObject var shownItem : ItemViewWrapper = ItemViewWrapper()
    @State var showDetailSheet = false
    @State var items : [Item] = []

    @EnvironmentObject var session: SessionManager
    var body: some View {
        NavigationView {
            ZStack {
                AppColors.lightGray2.edgesIgnoringSafeArea(.all)
                VStack() {
                    HomePageSearchBar().padding()
                    ScrollViewWithRefresh(refreshing: self.$refreshing, action: {
                        print("Refreshing")
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            self.refreshing = false
                        }
                    }) {
                        VStack (alignment: .leading) {
                            ZStack {
                                LinearGradient(gradient: Gradient(colors: [AppColors.lightGray2, AppColors.lightGray, Color.white, AppColors.lightGray2]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
                                VStack {
                                    HomeViewSlider()
                                        .padding(.horizontal)
                                        .frame(height: 200, alignment: .center)
                                    HomeViewNavBoard()
                                        .padding(.horizontal)
                                        .padding(.bottom)
                                }
                            }
                            Text("Popular Deals")
                                .font(.headline)
                                .padding(.horizontal)
                            
                            ForEach(0..<1) { _ in
                                ShopPoster().padding(.horizontal)
                            }
                            
                            
                            SegmentControl(selection: $selection, items: [
                                SegmentItem(selectionIndex: 0, title: "Picks For You"),
                                SegmentItem(selectionIndex: 1, title: "Top Deals")
                            ])
                            Grid(self.items.indices) { i in
                                HomeViewItemCell(showDetail: $showDetailSheet, item: self.items[i], currentItem: shownItem)
                            }.padding(.horizontal)
                            
                            Text("You've reached my bottom line").padding()
                        }
                    }
                    .gridStyle(
                        StaggeredGridStyle(.vertical, tracks: 2, spacing: 10)
                    )
                }
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
        }
        .onAppear(){
            if (!self.firstAppear) {
                //TODO change any to any cateogry later if needed
                self.session.newsfeedmanager?.getTopDeals(limit: Constants.TOP_DEALS_COUNT, category: "any", perform: { (itemsGRPC, error) in
                    if (error == nil) {
                        self.items = convertNewsFeedItemToItem(items: itemsGRPC!)
                        self.firstAppear = true
                    }
                    
                })
            }
        }
        .sheet(isPresented: $showDetailSheet, content: {
            shownItem.shownDetailedItem
        })
    }
    
    func convertNewsFeedItemToItem(items : [Newsfeed_ItemGrpc]) -> [Item] {
        var result = [Item]()
        for item in items {
            result.append(Item(id: Int(item.itemID), itemName: item.itemName, price: item.itemPrice, itemDescription: item.itemDescription, orderQuantity: 0, stock: Int(item.itemStock), category: item.category, owner: item.belongTo))
        }
        return result
    }
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView()
    }
}
