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
                    .foregroundColor(Color.pink)
                    .padding(.leading, 10)
                
                TextField("Search here", text: $content)
                
                if !content.isEmpty {
                    Button(action: {
                        content = ""
                    }) {
                        Image(systemName: "xmark.circle.fill").foregroundColor(Color(hex: 0xc98798))
                            .padding(.trailing, 10)
                    }
                }
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 40)
                .fill(Color.init(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                .frame(height: 35)
//                .shadow(color: AppColors.primaryColor, radius: 2, x: 0.0, y: 0.0)
                .overlay(
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(AppColors.primaryColor, lineWidth: 1)
                )
        )
    }
}

struct HomePageSearchTextField_Previews: PreviewProvider {
    static var previews: some View {
        HomePageSearchTextField()
    }
}
