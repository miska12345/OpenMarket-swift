//
//  EventDropDownPicker.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 9/26/20.
//

import SwiftUI

struct EventDropDownPicker: View {
    var body: some View {
        Button(action: {
            print("a")
        }) {
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "dollarsign.circle.fill")
                        .foregroundColor(Color.init(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)))
                        .padding(.vertical, 20)
                        .padding(.trailing, 5)
                        .padding(.leading, 20)
                    Text("Select a Currency")
                        .foregroundColor(.gray)
                        .padding(.trailing)
                    Spacer()
                    Image(systemName: "chevron.down").padding()
                }
            }
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.init(#colorLiteral(red: 0.9568627451, green: 0.9647058824, blue: 0.9764705882, alpha: 1))))
            .frame(maxWidth: .infinity)
        }
    }
}

struct EventDropDownPicker_Previews: PreviewProvider {
    static var previews: some View {
        EventDropDownPicker()
    }
}
