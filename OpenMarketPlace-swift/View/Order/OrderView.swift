//
//  OrderView.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/25/20.
//

import SwiftUI

struct OrderView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var session: SessionManager
    @EnvironmentObject var tabBarControl: TabBarModel
    @State var orders: [Marketplace_Order] = []
    var body: some View {
        ZStack {
            AppColors.lightGray.edgesIgnoringSafeArea(.all)
            VStack (alignment: .leading) {
                ScrollView {
                    VStack (alignment: .leading, spacing: 20) {
                        ForEach(self.orders.indices, id: \.self) { i in
                            OrderCell(order: self.orders[i])
                        }
                    }.padding()
                }
            }
            
        }.navigationBarTitle("Order History")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: GeneralBackButton(action: {
            self.tabBarControl.showTabbarView()
        }, dismissable: true, useSpacer: false))
//        .navigationBarHidden(true)
        .onAppear(perform: {
            tabBarControl.hideTabbarView()
            refreshOrders()
        })
    }
    
    func refreshOrders() {
<<<<<<< HEAD
        session.marketplaceManager?.getOrdersAsBuyer(perform: { (orders, error) in
            if error == nil {
                self.orders = orders?.sorted(by: { (order1, order2) -> Bool in
                    return Date.fromStr(timestamp: order1.createdAt)! > Date.fromStr(timestamp: order2.createdAt)!
                }) ?? []
                print(self.orders.count)
            }
        })
=======
//        session.marketplaceManager?.getOrdersAsBuyer(perform: { (orders, error) in
//            if error == nil {
//                self.orders = orders?.sorted(by: { (order1, order2) -> Bool in
//                    return Date.fromStr(timestamp: order1.createdAt)! > Date.fromStr(timestamp: order2.createdAt)!
//                }) ?? []
//                print(self.orders.count)
//            }
//        })
>>>>>>> 29892b1525dba8293a97f6ebbc69d4f3f4966cc4
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
