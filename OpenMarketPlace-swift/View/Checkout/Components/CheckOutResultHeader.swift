//
//  CheckOutResultHeader.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/25/20.
//

import SwiftUI

struct CheckOutResultHeader: View {
    var isSuccess = true
    var text = "You have successfully place 2 orders!"
    var body: some View {
        VStack {
            Image(systemName: (isSuccess ? "checkmark.circle" : "xmark.circle"))
                .resizable()
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .center)
                .scaledToFit()
                .foregroundColor(AppColors.primaryColor)
            Text(text)
                .font(.headline)
                .foregroundColor(AppColors.primaryColor)
        }
    }
}

struct CheckOutResultHeader_Previews: PreviewProvider {
    static var previews: some View {
        CheckOutResultHeader()
    }
}
