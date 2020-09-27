//
//  EventDatePicker.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 9/26/20.
//

import SwiftUI

struct EventDatePicker: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "calendar.circle.fill")
                    .foregroundColor(Color.init(#colorLiteral(red: 0.6156862745, green: 0.6431372549, blue: 0.6941176471, alpha: 1)))
                    .padding(.vertical, 20)
                    .padding(.trailing, 5)
                    .padding(.leading, 20)

                DatePicker(selection: .constant(Date()), label: { Text("Expiration date") })
                    .labelsHidden()
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                Spacer()
            }
        }

        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.init(#colorLiteral(red: 0.9568627451, green: 0.9647058824, blue: 0.9764705882, alpha: 1))))
    }
}

struct EventDatePicker_Previews: PreviewProvider {
    static var previews: some View {
        EventDatePicker()
    }
}
