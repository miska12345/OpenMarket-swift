//
//  GeneratedQRView.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/16/20.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

struct GeneratedQRView: View {
    @Binding var title: String
    @Binding var coinName: String
    @Binding var rewardAMount: Double
    @Binding var expirationDate: Date
    @Binding var qrString: String
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    var body: some View {
        generatedQRView()
    }
    
    func generatedQRView() -> some View {
        ZStack {
            VStack(alignment: .center) {
                Text("Event QR Code")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(.black)
                    .padding(.top)
                Divider()
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: .infinity, height: 350, alignment: .center)
                    .overlay(
                        VStack {
                            Text(title).font(.system(size: 27)).bold().foregroundColor(.white)
                            Text("Scan to get $\(String.toCurrencyStr(balance: rewardAMount) ?? "nil") \(coinName)").foregroundColor(.white).bold()
                            Image(uiImage: generateQRCode(from: qrString))
                                .interpolation(.none)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200, height: 200)
                            Text("Expires at \(String.toShortDateStr(date: expirationDate, timezone: true) ?? "error")").foregroundColor(Color.white)
                        }.shadow(color: .gray, radius: 10, x: 0, y: 0)
                        ).padding()
                    .foregroundColor(.blue)
                Image("NewEventWelcome").resizable().aspectRatio(contentMode: .fit)
            }.padding()
        }
    }
    
    func generateQRCode(from string: String) -> UIImage {
        let data = Data(string.utf8)
        filter.setValue(data, forKey: "inputMessage")

        if let outputImage = filter.outputImage {
            if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgimg)
            }
        }

        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
}

class GeneratedQRVIewWrapper: ObservableObject {
    @Published var qrView: GeneratedQRView = GeneratedQRView(
        title: Binding(get: {return "ABC"},set: { (_) in}),
        coinName: Binding(get: {return "COIN"},set: { (_) in}),
        rewardAMount: Binding(get: {return 0.0},set: { (_) in}),
        expirationDate: Binding(get: {return Date()},set: { (_) in}),
        qrString: Binding(get: {return "123"},set: { (_) in}))
    
    func update(v: GeneratedQRView) {
        self.qrView = v
    }
}

struct GeneratedQRView_Previews: PreviewProvider {
    static var previews: some View {
        GeneratedQRVIewWrapper().qrView
    }
}
