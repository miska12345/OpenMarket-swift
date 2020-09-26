//
//  SwiftUIView.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 9/24/20.
//

import SwiftUI

struct EventView: View {
    enum ViewType {
        case QR, DETAIL
    }
    @ObservedObject var session: SessionManager
    @State var enable: Bool = false
    @State var showAlert: Bool = false
    @State var alertMessage: String? = ""
    @State var showDetail: Bool = false
    
    @State var alertType: AlertType = .error
    @State var viewType: ViewType = .QR
    
    @State var event: Event_Event? = nil
    
    @State var code: String? = nil
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    CartButton(title: "Scan QR Code", backgroundColor: AppColors.generalBackgroundButtonColor, fontColor: AppColors.generalButtonForegroundColor,
                               perform: {
                        self.viewType = .QR
                        self.enable = true
                    }).padding()
                    
                }.sheet(isPresented: $enable) {
                    switch self.viewType {
                    case .QR:
                        QRView(presentedQRView: $enable, perform: { code in
                            self.enable = false
                            session.eventManager?.redeem(code) { event, error in
                                if error != nil {
                                    self.alertType = .error
                                    self.alertMessage = error?.message
                                    self.showAlert = true
                                    return
                                }
                                self.viewType = .DETAIL
                                self.event = event!
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                    self.enable = true
                                }
                            }
                        })
                    case .DETAIL:
                        EventDetailView(presentedBinding: $enable, event: self.event!)
                }
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Error!"), message: Text(self.alertMessage!), dismissButton: .destructive(Text("OK")))
            }
            .navigationTitle("Event")
            .navigationBarTitleDisplayMode(.inline)
        }
    
    }
}
}
//
//struct SwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        EventView(session: SessionManager())
//    }
//}
