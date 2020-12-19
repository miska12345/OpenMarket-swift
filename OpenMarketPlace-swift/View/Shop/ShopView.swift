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
    var body: some View {
        NavigationView {
            ZStack {
                AppColors.lightGray2.edgesIgnoringSafeArea(.all)
                VStack() {
                    HomePageSearchBar().padding()
                    ScrollView {
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
                                HomeViewItemCell()
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
    }
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView()
    }
}
