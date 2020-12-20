//
//  NewCartView.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/19/20.
//

import SwiftUI

struct NewCartView: View {
    var body: some View {
        NavigationView() {
            ZStack (alignment: .bottom) {
                AppColors.lightGray
                ScrollView() {
                    VStack (alignment: .center, spacing: 20) {
                        ForEach(0..<5) { _ in
                            CartViewOrgCell()
                        }
                        Text("~No More~")
                            .foregroundColor(.gray)
                            .frame(height: 50)
                            .padding(.bottom)
                    }
                    .padding()
                }
                CartViewCheckoutButton().padding()
                
                .navigationTitle("Cart")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct NewCartView_Previews: PreviewProvider {
    static var previews: some View {
        NewCartView()
    }
}
