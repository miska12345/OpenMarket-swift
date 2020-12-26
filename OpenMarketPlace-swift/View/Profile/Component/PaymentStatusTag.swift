//
//  PaymentStatusTag.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/25/20.
//

import SwiftUI

struct PaymentStatusTag: View {
    var status: String = "Confirmed"
    var color: Color = Color.green
    var body: some View {
        Text(status)
            .font(.system(size: 15))
            .foregroundColor(.green)
            .padding(.horizontal, 5)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(color, lineWidth: 1)
            )
    }
}

struct PaymentStatusTag_Previews: PreviewProvider {
    static var previews: some View {
        PaymentStatusTag()
    }
}
