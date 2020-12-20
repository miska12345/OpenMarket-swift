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
    
    @State var showDetailSheet = false
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
                                LinearGradient(gradient: Gradient(colors: [AppColors.lightGray2, AppColors.lightGray2, Color.white, AppColors.lightGray2]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
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

                            Grid(0..<10) { _ in
                                HomeViewItemCell(showDetail: $showDetailSheet)
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
        .sheet(isPresented: $showDetailSheet, content: {
            ItemView(showDetail: $showDetailSheet)
        })
    }
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView()
    }
}
