//
//  NewWalletView.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/16/20.
//

import SwiftUI

struct NewWalletView: View {
    @ObservedObject var session: SessionManager
    @ObservedObject var currencies: DictModel = DictModel()
    @State var currentSelection: Int = 0
    @State var transactions: [Transaction_QueryResultItem] = [Transaction_QueryResultItem]()
    @State private var firstRefresh: Bool = true
    @State var selection: Int = 0
    let conic = LinearGradient(gradient: Gradient(colors: [Color.white]), startPoint: .top, endPoint: .bottom)
    var body: some View {
        NavigationView {
            ZStack {
                conic.ignoresSafeArea()
                VStack {
                    WalletToolBar()
                    SegmentControl(selection: $selection, items: [SegmentItem(selectionIndex: 0, title: "Currency", colorOnSelect: AppColors.primaryColor, colorOnUnselect: Color.gray, colorForUnderline: AppColors.primaryColor),
                                                                  SegmentItem(selectionIndex: 1, title: "History", colorOnSelect: AppColors.primaryColor, colorOnUnselect: Color.gray)
                                        
                    ])
                    ScrollView {
                        buildTabView
                    }
                    Spacer()
                }
            }.navigationTitle("My Wallet")
        }.onAppear(perform: {
            if firstRefresh {
                refresh()
                firstRefresh = false
            }
        })
    }
    
    func refresh() {
        self.currencies.update(sm: session)
        refreshTransactions()
    }

    func refreshTransactions() {
        self.session.transactionManager?.getAllTransactions() { result, error in
            if error == nil {
                DispatchQueue.main.async {
                    self.transactions = result!
                    print(self.transactions.count)
                }
            }
        }
    }
    
    @ViewBuilder
    var buildTabView: some View {
        if selection == 0 {
            buildCoinView
        } else {
            buildHistoryView
        }
    }
    
    var buildCoinView: some View {
        VStack(spacing: 25) {
            ForEach(currencies.dict.sorted(by: <), id: \.key) { key, value in
                WalletCoinCell(coin: key, amount: value)
            }
        }.padding()
    }
    
    var buildHistoryView: some View {
        VStack (alignment: .leading) {
            Text("Recent activity").font(.system(size: 25)).fontWeight(.semibold)
            ForEach(transactions.sorted(by: { (item1, item2) -> Bool in
                item1.createdAt > item2.createdAt
            }), id: \.self) { item in
                let isPayer = item.payerID == AuthManager.shared.currentUser!.username
                WalletHistoryCell(otherID: isPayer ? item.recipientID : item.payerID, coin: item.moneyAmount.currencyID, time: Date.fromStr(timestamp:  item.createdAt) ?? Date(), note: item.note, amount: item.moneyAmount.amount, isPayer: isPayer)
            }
        }.padding()
    }
}

struct NewWalletView_Previews: PreviewProvider {
    static var previews: some View {
        preview()
    }
    
    struct preview: View {
        @State var session = SessionManager()
        @State var dict = DictModel()
        var body: some View {
            NewWalletView(session: session, currencies: dict)
        }
    }
}
