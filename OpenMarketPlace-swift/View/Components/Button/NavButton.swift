//
//  NavButton.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/25/20.
//

import SwiftUI

struct NavButton: View {
    var text:String = "Detail"
    var body: some View {
        HStack {
            Text(text)
            Spacer()
            Image(systemName: "chevron.right")
        }
    }
}

struct NavButton_Previews: PreviewProvider {
    static var previews: some View {
        NavButton()
    }
}
