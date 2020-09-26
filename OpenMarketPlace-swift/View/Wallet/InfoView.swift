//
//  InfoView.swift
//  WalletAppExploration
//
//  Created by Raphael Cerqueira on 17/08/20.
//  Copyright © 2020 ShangJin All rights reserved.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    RowView()
                }
            }
        }
        .padding()
        .cornerRadius(40)
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}

struct RowView: View {
    var body: some View {
        VStack {
            HStack {
                ZStack {
                    Circle()
                        .frame(width: 70, height: 70)
                        .foregroundColor(Color.red.opacity(0.3))
                    
                    Text("MI")
                        .foregroundColor(.red)
                }
                
                VStack(alignment: .leading) {
                    Text("FishCoin")
                        .bold()
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    Text("Order for Macbook Pro")
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                        .padding(.top, 8)
                        .lineLimit(2)
                }
                .padding(.leading)
                .padding(.trailing)
                
                Spacer()
                
                VStack {
                    HStack(spacing: 4) {
                        Text("+")
                            .foregroundColor("+".elementsEqual("-") ? Color(#colorLiteral(red: 0.8930629492, green: 0.4423119426, blue: 0.4597078562, alpha: 1)) : Color(#colorLiteral(red: 0.3912505507, green: 0.7258948088, blue: 0.3816880286, alpha: 1)))
                        
                        Text("$6.66")
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                    }
                    Text("Pending").foregroundColor(Color(hex: 0x2980b9))
                }
            }
            
            Divider().background(Color.gray)
                .padding(.vertical, 8)
        }
    }
}
