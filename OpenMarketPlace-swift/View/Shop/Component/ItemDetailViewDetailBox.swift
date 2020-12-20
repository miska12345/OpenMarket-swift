//
//  ItemDetailViewDetailBox.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/19/20.
//

import SwiftUI

struct ItemDetailViewDetailBox: View {
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                Text("Detail")
                    .fontWeight(.semibold)
                    .minimumScaleFactor(0.5)
                Spacer()
            }
            Divider()
            Text("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here")
        }
    }
}

struct ItemDetailViewDetailBox_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailViewDetailBox()
    }
}
