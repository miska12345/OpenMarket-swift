//
//  ItemOrgView.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/20/20.
//

import SwiftUI

struct ItemOrgView: View {
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                Text("Organization")
                    .fontWeight(.semibold)
                    .minimumScaleFactor(0.5)
                Spacer()
            }
            Divider()
            
        }
    }
}

struct ItemOrgView_Previews: PreviewProvider {
    static var previews: some View {
        ItemOrgView()
    }
}
