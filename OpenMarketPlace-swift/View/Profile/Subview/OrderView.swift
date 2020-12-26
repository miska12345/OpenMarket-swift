//
//  OrderView.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/25/20.
//

import SwiftUI

struct OrderView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack {
            AppColors.lightGray.edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack (alignment: .leading, spacing: 20) {
                    ForEach(0..<2) { _ in
                        OrderCell()
                    }
                }.padding()
            }
        }.navigationBarTitle("Order History")
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(leading: Image(systemName: "chevron.left")
                                .onTapGesture {
                                    self.presentationMode.wrappedValue.dismiss()
                                })
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
