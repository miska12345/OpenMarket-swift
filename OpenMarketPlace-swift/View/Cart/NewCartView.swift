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
    @EnvironmentObject var session : SessionManager
    var body: some View {
        NavigationView() {
            buildCartView
        }
        .environment(\.rootPresentationMode, self.$isPresented)
    }
    
    @ViewBuilder
    var buildCartView: some View {
        CartView
    }
    
    var CartView: some View {
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
    
    var emptyCartView: some View {
        VStack {
            HStack {
                Image(systemName: "paperplane.fill")
                Text("You have not added anything yet")
            }
            GeneralButton(title: "Go Shop Shop", perform: {
                print("shop")
            }).padding()
        }
    }
}





struct NewCartView_Previews: PreviewProvider {
    static var previews: some View {
        NewCartView()
    }
}
