//
//  NewCartView.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/19/20.
//

import SwiftUI

struct NewCartView: View {
    @State var showCheckOutView: Bool = false
    @State var isPresented = false
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
                NavigationLink(
                    destination: NewCheckOutView(),
                    isActive: $isPresented,
                    label: {
                        CartViewCheckoutButton()
                            .padding()
                    }).isDetailLink(false)
                    .buttonStyle(PlainButtonStyle())
                
                .navigationTitle("Cart")
                .navigationBarTitleDisplayMode(.inline)
            }
            
        }
        .environment(\.rootPresentationMode, self.$isPresented)
    }
}

struct NewCartView_Previews: PreviewProvider {
    static var previews: some View {
        NewCartView()
    }
}
