//
//  WalletHistoryCell.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/16/20.
//

import SwiftUI

struct WalletHistoryCell: View {
    var otherID: String = "Unknown"
    var coin: String = "BitCoin"
    var time: Date?
    var note: String = ""
    var amount: Double = 0.0
    var isPayer: Bool = false
    var body: some View {
        Button(action: {
            
        }) {
            VStack {
                HStack {
                    ZStack {
                        Circle()
                            .frame(width: 50, height: 50)
                            .foregroundColor(Color.red.opacity(0.3))
                        
                        Text(otherID.prefix(2).uppercased())
                            .foregroundColor(.red)
                    }
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text(otherID)
                            .bold()
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        Text("\(time != nil ? time!.getElapsedInterval() : "") \(note.isEmpty ? "" : " • " + note)")
                            .foregroundColor(.gray)
                            .lineLimit(1)
                    }
                    .padding()
                    
                    Spacer()
                    
                    VStack (alignment: .trailing, spacing: 5) {
                        HStack(spacing: 4) {
                            Text(isPayer ? "-" : "+")
                                .foregroundColor(isPayer ? Color(#colorLiteral(red: 0.8930629492, green: 0.4423119426, blue: 0.4597078562, alpha: 1)) : Color(#colorLiteral(red: 0.3912505507, green: 0.7258948088, blue: 0.3816880286, alpha: 1)))
                            Text("\(String.toCurrencyStr(balance: amount, useSymbol: true) ?? "0") \(coin)")
                                .fontWeight(.bold)
                                .foregroundColor(isPayer ? .black : .green)
                        }
                        Text(String(describing: "complete")).foregroundColor(Color(hex: 0x2980b9))
                    }
                }
            }
        }
    }
}

struct WalletHistoryCell_Previews: PreviewProvider {
    static var previews: some View {
        WalletHistoryCell()
    }
}
