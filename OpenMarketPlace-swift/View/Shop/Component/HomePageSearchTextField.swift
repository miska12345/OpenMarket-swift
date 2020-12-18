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
                    .foregroundColor(Color.init(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
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
                .fill(Color.init(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                .frame(height: 35)
                .shadow(color: .gray, radius: 1, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
        )
    }
}

struct HomePageSearchTextField_Previews: PreviewProvider {
    static var previews: some View {
        HomePageSearchTextField()
    }
}
