//
//  CartButton.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 9/22/20.
//

import SwiftUI

struct GeneralButton: View {
    var title: String
    var backgroundColor = Color.yellow
    var fontColor = Color.black
    var height = CGFloat(45)
    var perform: ()->()
    var body: some View {
        Button(action: {
            self.perform()
        }) {
            RoundedRectangle(cornerRadius: 5)
                .foregroundColor(backgroundColor)
                .frame(height: self.height)
                .shadow(color: .gray, radius: 2, x: 0, y: 0)
                .overlay(Text(title)
                            .foregroundColor(fontColor))
        }
    }
}

struct CartButton_Previews: PreviewProvider {
    static var previews: some View {
        GeneralButton(title: "Button", perform: { print("hi") })
    }
}
