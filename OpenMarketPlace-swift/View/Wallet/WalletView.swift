//
//  WalletView.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 9/25/20.
//

import SwiftUI

struct WalletView: View {
    @ObservedObject var session: SessionManager
    @ObservedObject var currencies: DictModel = DictModel()
    var body: some View {
        ZStack {
            ZStack(alignment: .bottom) {
                VStack(alignment: .leading) {
                    HStack {
                        Text("My Wallet")
                            .font(.system(size: 32, weight: .bold))
                            .foregroundColor(.black)
                            .padding(.top)
                        
                        Spacer()
                        
                        Button(action: {
                            self.currencies.update(sm: session)
                        }) {
                            ZStack(alignment: .topTrailing) {
                                Image(systemName: "arrow.clockwise")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 25)
                                    .foregroundColor(Color(#colorLiteral(red: 0.6621162891, green: 0.6699317694, blue: 0.7221717238, alpha: 1)))
                                
                                Circle()
                                    .foregroundColor(Color(#colorLiteral(red: 0.9981037974, green: 0.4815000892, blue: 0.483004272, alpha: 1)))
                                    .frame(width: 10, height: 10)
                            }
                        }
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(currencies.dict.sorted(by: >), id: \.key) { key, value in
                                CoinView(coinName: key, balance: value, colors: [Color.random, Color.random])
                            }
                        }
                    }
                    .padding(.top, 32)
                    
                    
                    
//                    CoinSliderView(currencies: $currencies)
                    Divider()
                    
                    InfoView()
                        .edgesIgnoringSafeArea(.bottom)
                        .frame(height: 350)
                    Spacer()
                }
                .padding(.horizontal)
            
            }
        }.onAppear() {
            print("hey")
        }
    }
}

class DictModel: ObservableObject {
    @Published var dict: [String: Double] = [:]
    var count: Int = 0
    func setDict(_ newDict: [String: Double]) {
        DispatchQueue.main.async {
            self.dict = [:]
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                for (key, value) in newDict {
                    print("(\(key),\(value))")
                    self.dict[key] = value
                }
            }
        }
    }
    
    func update(sm session: SessionManager) {
        session.transactionManager?.getWallet(perform: { dic, error in
            if error != nil {
                print(error?.message!)
                return
            }
            self.count += 1
            self.setDict(dic!)
            print(self.dict)
        })
    }
}

struct WalletView_Previews: PreviewProvider {
    static var previews: some View {
        WalletView(session: SessionManager())
    }
}

struct CoinSliderView: View {
    @Binding var currencies: Dictionary<String, Double>
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(currencies.sorted(by: >), id: \.key) { key, value in
                    CoinView(coinName: key, balance: value, colors: [Color.random, Color.random])
                }
            }
        }
        .padding(.top, 32)
    }
}
