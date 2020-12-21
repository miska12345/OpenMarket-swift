//
//  ItemDetailViewDetailBox.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/19/20.
//

import SwiftUI

struct ItemDetailViewDetailBox: View {
    var itemDescription : String
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                Text("Detail")
                    .fontWeight(.semibold)
                    .minimumScaleFactor(0.5)
                Spacer()
            }
            Divider()
            Text(itemDescription)
        }
    }
}

//struct ItemDetailViewDetailBox_Previews: PreviewProvider {
//    static var previews: some View {
//        ItemDetailViewDetailBox()
//    }
//}
