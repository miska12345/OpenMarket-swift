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
    
    @State var firstAppear: Bool = true
    
    @ObservedObject var events: EventsList = EventsList()
    
    @State var showQRView = false
    @ObservedObject var qrViewToShow: GeneratedQRVIewWrapper = GeneratedQRVIewWrapper()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    HStack() {
                        Text("Events Created By You").bold().font(.headline)
                        Spacer()
                        eventRefreshButton()
                    }
                    buildEventView
                }.padding()
            .navigationTitle("Event")
            .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(leading: Button(action: {
                    self.viewType = .QR
                    self.enable = true
                }) {
                    Image(systemName: "qrcode.viewfinder").foregroundColor(.black)
                }, trailing: Button(action: {
                    self.viewType = .NEWEVENT
                    self.enable = true
                }) {
                    Image(systemName: "plus.circle").foregroundColor(.black)
                })
                    .sheet(isPresented: $enable) {
                    SheetView(session: session, enable: $enable, type: $viewType, event: $event, showAlert: $showAlert, alertMessage: $alertMessage)
                        
                    }
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("Error!"), message: Text(self.alertMessage!), dismissButton: .destructive(Text("OK")))
                }
            }
            .background(AppColors.lightGray)
        }.onAppear(perform: {
            if firstAppear {
                refreshMyEvents()
                firstAppear = false
            }
        }).sheet(isPresented: $showQRView, content: {
            qrViewToShow.qrView
        })
    }
    
    @ViewBuilder
    var buildEventView: some View {
        if events.items.count == 0 {
            emptyEventView
        } else {
            regularEventView
        }
    }
    
    var emptyEventView: some View {
        VStack {
            HStack {
                Image(systemName: "paperplane.fill")
                Text("You have not created any event yet")
            }
            GeneralButton(title: "Create Event", perform: {
            }).padding()
        }
        
    }
    
    var regularEventView: some View {
        ForEach(self.events.items, id: \.self) { item in
            
            EventViewCell(showQRCodeView: $showQRView, qrViewToShow: qrViewToShow, event: item).environmentObject(session)
                .environmentObject(events)
        }
    }
    
    func refreshMyEvents() {
        session.eventManager?.getOwnedEvent(perform: { (evs, error) in
            if error != nil {
                print(error!)
            } else {
                self.events.update(events: evs!)
            }
        })
    }
    
    func eventRefreshButton() -> some View {
        Button(action: {
            refreshMyEvents()
        }) {
            Image(systemName: "arrow.clockwise")
        }
    }
}

class EventsList: ObservableObject {
    @Published var items = [Event_Event]()
    
    func update(events: [Event_Event]) {
        DispatchQueue.main.async {
            self.items = events.sorted(by: { (e1, e2) -> Bool in
                return e1.expiresAt < e2.expiresAt
            })
        }
    }
    
    func remove(eventID: String) {
        DispatchQueue.main.async {
            if let i = self.items.firstIndex(where: { (e) -> Bool in
                return e.eventID == eventID
            }) {
                self.items.remove(at: i)
            }
        }
    }
}


struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        EventView(session: SessionManager())
    }
}

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
            NewEventView(enable: $enable, session: session)
        }
    }
}
