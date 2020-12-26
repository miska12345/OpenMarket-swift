//
//  NewCheckOutView.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/24/20.
//

import SwiftUI

struct NewCheckOutView: View {
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
                destination: CheckOutResultView(),
                label: {
                    CartViewCheckoutButton(title: "Pay")
                        .padding()
                })
            
        }
    }
}

struct NewCheckOutView_Previews: PreviewProvider {
    static var previews: some View {
        NewCheckOutView()
    }
}
