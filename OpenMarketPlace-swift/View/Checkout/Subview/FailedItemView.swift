//
//  FailedItemView.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/25/20.
//

import SwiftUI

struct FailedItemView: View {
    @Binding var showUnavailableItem: Bool
    var body: some View {
        VStack () {
            HStack {
                Spacer()
                Text("Unavailable Items (2)")
                    .font(.headline)
                Spacer()
                Image(systemName: "xmark.circle.fill")
                    .resizable()
                    .frame(width: 25, height: 25, alignment: .center)
                    .scaledToFit()
                    .foregroundColor(Color(hex: 0xcccccc))
                    .onTapGesture {
                        self.showUnavailableItem = false
                    }
            }.padding(.bottom)
        
            ScrollView {
                ForEach(0..<2) { _ in
                    CartViewItemCell(isCancelable: false, isOutOfStock: true, backgroundColor: AppColors.lightGray)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
            
        }.padding()
    }
}

struct FailedItemView_Previews: PreviewProvider {
    static var previews: some View {
        FailedItemView(showUnavailableItem: .constant(true))
    }
}
