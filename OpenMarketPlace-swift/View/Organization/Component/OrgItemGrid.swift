//
//  OrgItemGrid.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/20/20.
//

import SwiftUI
import Grid

struct OrgItemGrid: View {
    @State var showDetailSheet: Bool = false
    @ObservedObject var shownItem: ItemViewWrapper = ItemViewWrapper()
    var body: some View {
        VStack (alignment: .leading) {
//            HStack {
//                Text("Events")
//                    .font(.system(size: 18, weight: .semibold))
//                Spacer()
//                Image(systemName: "chevron.right")
//                    .foregroundColor(AppColors.darkGray)
//            }
            OrgNavLink(title: "Items")
            Grid(0..<6) { _ in
                HomeViewItemCell(showDetail: $showDetailSheet, item: Item(id: 1, itemName: "ABC", price: 10, itemDescription: "dlkfjakldnv", orderQuantity: 10, stock: 10, category: "", owner: ""), currentItem: shownItem)
            }
            .gridStyle(
                StaggeredGridStyle(.vertical, tracks: 2, spacing: 10)
            )
        }
        .padding()
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 25) )
    }
}

struct OrgItemGrid_Previews: PreviewProvider {
    static var previews: some View {
        OrgItemGrid()
    }
}
