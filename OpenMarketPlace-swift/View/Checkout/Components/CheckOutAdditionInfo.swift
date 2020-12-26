//
//  CheckOutAdditionInfo.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/24/20.
//

import SwiftUI

struct CheckOutAdditionInfo: View {
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                VStack (alignment: .leading) {
                    Text("Miska")
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                        .minimumScaleFactor(0.1)
                        .scaledToFit()
                        .padding(.bottom, 5)
                    Text("me@example.com")
                    Text("(206) 123-4567")
                    Text("Note (Optional)")
                        .lineLimit(1)
                        .foregroundColor(.gray)
                        .padding(.top, 5)
                }
                Spacer()
                Image(systemName: "chevron.right")
            }
        }
        .padding()
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 10.0))
    }
}

struct CheckOutAdditionInfo_Previews: PreviewProvider {
    static var previews: some View {
        CheckOutAdditionInfo()
    }
}
