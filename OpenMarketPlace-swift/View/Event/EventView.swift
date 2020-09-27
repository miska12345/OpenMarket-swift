//
//  SwiftUIView.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 9/24/20.
//

import SwiftUI

enum ViewType {
    case QR, DETAIL, NEWEVENT
}

struct EventView: View {
    @ObservedObject var session: SessionManager
    @State var enable: Bool = false
    @State var showAlert: Bool = false
    @State var alertMessage: String? = ""
    @State var showDetail: Bool = false
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
                    })
                        .padding()
                    
                    CartButton(title: "Create New Event", backgroundColor: AppColors.generalBackgroundButtonColor, fontColor: AppColors.generalButtonForegroundColor,
                               perform: {
                        self.viewType = .NEWEVENT
                        self.enable = true
                    })
                        .padding()

                }.sheet(isPresented: $enable) {
                    SheetView(session: session, enable: $enable, type: $viewType, event: $event, showAlert: $showAlert, alertMessage: $alertMessage)
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

struct SheetView: View {
    @ObservedObject var session: SessionManager
    @Binding var enable: Bool
    @Binding var type: ViewType
    @Binding var event: Event_Event?
    @Binding var showAlert: Bool
    @Binding var alertMessage: String?
    @State var showDetail: Bool = false
    var body: some View {
        switch self.type {
        case .QR:
            QRView(presentedQRView: $enable, perform: { code in
                self.enable = false
                if (code.isEmpty) {
                    return
                }
                session.eventManager?.redeem(code) { event, error in
                    if error != nil {
                        self.alertMessage = error?.message
                        self.showAlert = true
                        return
                    }
                    self.type = .DETAIL
                    self.event = event!
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        self.enable = true
                    }
                }
            })
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Error!"), message: Text(self.alertMessage!), dismissButton: .destructive(Text("OK")))
            }
        case .DETAIL:
            if let realEvent = self.event {
                EventDetailView(presentedBinding: $enable, event: realEvent)
            }
        case .NEWEVENT:
            NewEventView(enable: $enable)
        }
    }
}
