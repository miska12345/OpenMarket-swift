//
//  CoinView.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 9/25/20.
//

import SwiftUI

struct CoinView: View {
    @State var coinName: String
    @State var balance: Double
    var colors: [Color]
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack(alignment: .leading) {
                HStack {
                    Text(self.coinName)
                        .font(.system(size: 32))
                        .fontWeight(.bold)
                        .padding(.leading, 10)
                    
                    Spacer()
                    
                    ZStack {
                        Image(systemName: "dollarsign.circle.fill")
                            .resizable()
                            .foregroundColor(Color(#colorLiteral(red: 0.9995114207, green: 0.7353406549, blue: 0.3102956414, alpha: 1)))
                            .frame(width: 20, height: 20)
                            .offset(x: -10)
                            .padding()
                    }
                }
                Text("$\(String(format: "%.2f", balance))")
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .padding(.leading, 10)
            }
            .padding()
            .frame(height: 150)
            .foregroundColor(.white)
            .background(LinearGradient(gradient: Gradient(colors: [colors[0], colors[1]]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(20)
            
            Circle()
                .frame(width: 90, height: 90)
                .foregroundColor(Color.white.opacity(0.3))
                .offset(x: 10, y: 10)
            
        }
        .padding()
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(radius: 5)
    }
}

struct CoinView_Previews: PreviewProvider {
    static var previews: some View {
        CoinView(coinName: "FishCoin", balance: 3.23, colors:  [Color(#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)), Color(#colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1))])
    }
}
