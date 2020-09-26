//
//  QRView.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 9/24/20.
//

import SwiftUI
import CodeScanner
import AVFoundation //import to access barcode types you want to scan

struct QRView: View {
    @Binding var presentedQRView: Bool
    var perform: (String)->()
    @State private var isShowingScanner = true
    var body: some View {
        CodeScannerView(codeTypes: [.qr]) { result in
            switch result {
                case .success(let code):
                    perform(code)
//                    self.presentedQRView = false
                case .failure(let error):
                    print(error.localizedDescription)
                }
        }
        .ignoresSafeArea()
    }
}
