//
//  NewEventView.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 9/26/20.
//

import SwiftUI

struct NewEventView: View {
    @Binding var enable: Bool
    @ObservedObject var session: SessionManager
    @State var eventName: String = ""
    @State var rewardAmount: String = ""
    @State var totalAmount: String = ""
    @State var endDate: Date = Date()
    
    @State var showAlert: Bool = false
    @State var alertMessage: String?
    @State var disableOnClose: Bool = false
    
    @ObservedObject var currencies: DictModel = DictModel()
    @State var currentCoinSelected = ""
    
    @State var showGeneratedQR = false
    @State var newEventId = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                NavigationLink(destination: GeneratedQRView(title: $eventName, coinName: $currentCoinSelected, rewardAMount: Binding(get: {
                    return Double(self.rewardAmount) ?? 0.0
                }, set: { (_) in
                }), expirationDate: $endDate, qrString: $newEventId).navigationBarHidden(true), isActive: $showGeneratedQR) {
                                    EmptyView()
                }.frame(width: 0, height: 0)
                .hidden()
                createNewEventView().navigationBarTitle(Text(""), displayMode: .inline).navigationBarHidden(true).navigationBarBackButtonHidden(true)
            }
        }
//        .sheet(isPresented: $showGeneratedQR, onDismiss: {
//            self.enable = false
//        }, content: {
//            GeneratedQRView(enable: $showGeneratedQR, title: $eventName, coinName: $currentCoinSelected, rewardAMount: $rewardAmount, expirationDate: $endDate, qrString: $newEventId)
//        })
    }
    
    func refresh() {
        self.currencies.update(sm: session)
    }
    
    func createNewEventView() -> some View {
        VStack {
            HStack {
                Text("New Event")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(.black)
                    .padding(.top)

                Spacer()

                Button(action: {
                    self.enable = false
                }) {
                    ZStack(alignment: .topTrailing) {
                        Image(systemName: "xmark.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25)
                            .foregroundColor(Color(#colorLiteral(red: 0.6621162891, green: 0.6699317694, blue: 0.7221717238, alpha: 1)))
                    }
                }
            }
            Divider()
            ScrollView {
                Image("asset1").resizable().aspectRatio(contentMode: .fill)
                EventTextField(string: $eventName, iconName: "flag.fill", placeholder: "Please enter event name", isNumeric: false)
                EventDropDownPicker(currentCoinSelected: $currentCoinSelected, currenciesDict: currencies)
                EventTextField(string: $rewardAmount, iconName: "dollarsign.circle.fill", placeholder: "Please enter reward amount", isNumeric: true)
                EventTextField(string: $totalAmount, iconName: "dollarsign.circle.fill", placeholder: "Please enter total amount", isNumeric: true)
                EventDatePicker(date: $endDate, hideKeyboard: true)
                GeneralButton(title: "Create Event", backgroundColor: AppColors.generalBackgroundButtonColor, fontColor: AppColors.generalButtonForegroundColor,
                                       perform: {
                                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                        session.eventManager?.create(name: eventName, currency: currentCoinSelected, rewardAmount: Double(rewardAmount) ?? 0.0, totalAmount: Double(totalAmount) ?? 0.0, endDate: endDate, perform: { id, error in
                                            if error != nil {
                                                alertMessage = error!.message
                                                disableOnClose = false
                                                showAlert = true
                                            } else {
                                                self.newEventId = id!
                                                self.showGeneratedQR = true
                                                print("OK")
                                            }
                                        })
                            })
                                .padding()
            }
            
        }
        .padding()
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Result"), message: Text(self.alertMessage!), dismissButton: .destructive(Text("OK")) {
                if disableOnClose {
                    enable = false
                }
            })
        }.onAppear(perform: {
            refresh()
        })
    }
}

struct NewEventView_Previews: PreviewProvider {
    static var previews: some View {
        MyView()
    }
}

struct MyView: View {
    @State var enable: Bool = true
    @State var session: SessionManager = SessionManager()
    var body: some View {
        NewEventView(enable: $enable, session: session)
    }
}
