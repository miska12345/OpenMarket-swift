//
//  CheckOutResultView.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/25/20.
//

import SwiftUI

struct CheckOutResultView: View {
    @Environment(\.rootPresentationMode) private var rootPresentationMode
    var sucessOrders = [Marketplace_Order]()
    var body: some View {
        ZStack {
            AppColors.lightGray.edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack {
                    CheckOutResultHeader()
                    GeneralButton(title: "Continue Shopping", backgroundColor: AppColors.primaryColor, fontColor: Color.white, height: 50, perform: {
                        self.rootPresentationMode.wrappedValue.dismiss()
                    })
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding()
                    
                    ScrollView {
                        VStack (spacing: 20) {
                            ForEach(self.sucessOrders.indices) { index in
                                OrderResultBox(showUnavailableItem: false, order: self.sucessOrders[index])
                            }
                        }.padding()
                    }
                }
                
            }
        }.navigationBarHidden(true)
        
    }
}

struct CheckOutResultView_Previews: PreviewProvider {
    static var previews: some View {
        CheckOutResultView()
    }
}
