//
//  NewCheckOutView.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/24/20.
//

import SwiftUI

struct NewCheckOutView: View {
    @EnvironmentObject var session: SessionManager
    @State var sucessOrders : [Marketplace_Order] = []
    @State var transition: Int? = -1
    var body: some View {
        ZStack (alignment: .bottom) {
            AppColors.lightGray.edgesIgnoringSafeArea(.all)
        
            ScrollView {
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        Text("Personal Information")
                            .fontWeight(.semibold)
                        CheckOutAdditionInfo()
                    }.padding(.bottom)
                    
                    VStack(alignment: .leading) {
                        Text("Order Summary")
                            .fontWeight(.semibold)
                        CheckOutOrdeSummary()
                    }
                }.padding()
            }
            NavigationLink(
                destination: CheckOutResultView(sucessOrders: self.sucessOrders),
                tag: 1,
                selection: $transition,
                label: {
                    CartViewCheckoutButton(title: "Pay")
                        .onTapGesture {
                            session.marketplaceManager?.checkout(items: convertCartsToDict(), perform: { (successfulOrders, error) in
                                self.sucessOrders = successfulOrders!
                                self.transition = 1
                                self.session.cartManager?.carts.removeAll()
                            })
                        }
                        .padding()
                })
            
        }
    }
    
    func convertCartsToDict() -> Dictionary<Int32, Int32>{
        var result: Dictionary<Int32, Int32> = Dictionary<Int32, Int32>()
        self.session.cartManager?.getCartsKeys().forEach{ key in
            let items = session.cartManager?.carts[key]?.items
            for item in items! {
                result[Int32(item.id)] = Int32(item.orderQuantity)
            }
        }
        
        return result
    }
}

struct NewCheckOutView_Previews: PreviewProvider {
    static var previews: some View {
        NewCheckOutView()
    }
}
