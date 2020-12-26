//
//  CheckOutOrdeSummary.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/24/20.
//

import SwiftUI

struct CheckOutOrdeSummary: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 15) {
            Text("Total (2 items)")
            CheckOutItemScrollView()
            Divider()
            ForEach(0..<2) { _ in
                HStack {
                    CoinLabel()
                    Spacer()
                    Text("$10")
                }
            }
        }
        .padding()
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct CheckOutOrdeSummary_Previews: PreviewProvider {
    static var previews: some View {
        CheckOutOrdeSummary()
    }
}
