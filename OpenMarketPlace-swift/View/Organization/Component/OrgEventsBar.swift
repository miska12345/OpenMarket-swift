//
//  OrgEventsView.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/20/20.
//

import SwiftUI

struct OrgEventsBar: View {
    var body: some View {
        VStack (alignment: .leading) {
            OrgNavLink(title: "Events")
            Divider()
            ScrollView(.horizontal) {
                HStack {
                    ForEach(0..<5) { i in
                        OrgEventCell()
                    }
                }
            }
        }
        .padding()
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 25) )
    }
}

struct OrgEventsView_Previews: PreviewProvider {
    static var previews: some View {
        OrgEventsBar()
    }
}
