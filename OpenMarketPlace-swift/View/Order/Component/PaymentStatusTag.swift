//
//  PaymentStatusTag.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/25/20.
//

import SwiftUI

struct PaymentStatusTag: View {
    static var STATUS_PENDING: PaymentStatusTag = PaymentStatusTag(status: "Pending", color: .orange)
    static var STATUS_CONFIRMED: PaymentStatusTag = PaymentStatusTag(status: "Confirmed", color: .green)
    static var STATUS_ERROR: PaymentStatusTag = PaymentStatusTag(status: "Error", color: .red)
    
    var status: String = "Confirmed"
    var color: Color = Color.green
    var body: some View {
        Text(status)
            .font(.system(size: 15))
            .foregroundColor(color)
            .frame(minWidth: 70)
            .padding(.horizontal, 5)
            .padding(.vertical, 5)
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
