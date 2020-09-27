//
//  NavBarView.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 9/26/20.
//

import SwiftUI

struct NavBarView: View {
    let items = ["Paid", "Received"]
    @Binding var selectedIndex: Int
    var body: some View {
        HStack(spacing: 40) {
            ForEach(0 ..< self.items.count) { i in
                Button(action: {
                    self.selectedIndex = i
                }) {
                    Text(self.items[i])
                        .font(.system(size: self.selectedIndex == i ? 22 : 18))
                        .fontWeight(self.selectedIndex == i ? .semibold : .regular)
                        .foregroundColor(self.selectedIndex == i ? .gray : .gray)
                }
            }
        }
    }
}

struct NavBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavBarView(selectedIndex: .constant(0))
    }
}
