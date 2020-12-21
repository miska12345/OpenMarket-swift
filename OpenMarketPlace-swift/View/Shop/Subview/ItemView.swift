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
        NavigationView {
            GeometryReader() { geo in
                ZStack (alignment: .bottom) {
                    VStack (alignment: .leading) {
                        GeneralBackButton(text: itemName, action: {
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
            .navigationBarTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
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
