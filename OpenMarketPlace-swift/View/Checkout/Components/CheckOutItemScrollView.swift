//
//  CheckOutItemScrollView.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/24/20.
//

import SwiftUI

struct CheckOutItemScrollView: View {
    var body: some View {
        HStack {
            ScrollView(.horizontal) {
                HStack {
                    ForEach (0..<5) { i in
                        Image("Item_PS5")
                            .resizable()
                            .frame(width: 50, height: 50, alignment: .center)
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
            }
            Spacer()
            Image(systemName: "chevron.right")
        }
        .onTapGesture {
            print("Tapped")
        }
    }
}

struct CheckOutItemScrollView_Previews: PreviewProvider {
    static var previews: some View {
        CheckOutItemScrollView()
    }
}
