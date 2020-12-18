//
//  HomePageSearchTextField.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/17/20.
//

import SwiftUI

struct HomePageSearchTextField: View {
    @State var content = ""
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color.init(#colorLiteral(red: 0.6156862745, green: 0.6431372549, blue: 0.6941176471, alpha: 1)))
                    .padding(.leading, 10)
                
                TextField("Search here", text: $content)
                
                if !content.isEmpty {
                    Button(action: {
                        content = ""
                    }) {
                        Image(systemName: "xmark.circle.fill").foregroundColor(Color(hex: 0xbdc3c7))
                            .padding(.trailing, 10)
                    }
                }
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 40)
                .fill(Color.init(#colorLiteral(red: 0.9568627451, green: 0.9647058824, blue: 0.9764705882, alpha: 1)))
                .frame(height: 35)
        )
    }
}

struct HomePageSearchTextField_Previews: PreviewProvider {
    static var previews: some View {
        HomePageSearchTextField()
    }
}
