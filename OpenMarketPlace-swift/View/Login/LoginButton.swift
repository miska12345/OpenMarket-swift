//
//  LoginButtons.swift
//  SwiftUI-LoginView
//
//  Created by Максим on 26.04.2020.
//  Copyright © 2020 Максим. All rights reserved.
//

import SwiftUI

struct LoginButtons: View {
    // The states depending on which a specific alert will be shown
    enum alertState {
        case standartError
    }
    var session: SessionManager
    
    @Binding var bindUsername: String
    @Binding var bindPassword: String
    @State var presentedTabBarView: Bool = false
    
    @State private var errorMesssage: String?
    @State private var presentedAlert = false
    @State private var presentedSignUpPage: Bool = false
    
    @State private var alert: alertState = .standartError
    
    fileprivate func login() {
       // Attempt to login
        AuthManager.shared.login(uname: bindUsername, pass: bindPassword, perform: { user, error in
            if error != nil {
                self.errorMesssage = error?.message
                self.alert = .standartError
                self.presentedAlert = true
                return
            }
            print("You are in!")
            self.session.initiateSession()
            self.presentedTabBarView = true
        })
    }
    
    var body: some View {
        VStack(alignment: .trailing) {
            Button(action: { self.login() }) {
                Rectangle()
                    .fill(Color.init(#colorLiteral(red: 0.9098039269, green: 0.5668996837, blue: 0.6566165896, alpha: 1)))
                    .frame(height: 50, alignment: .center)
                    .overlay(Text("Sign In").foregroundColor(.white).bold())
                    .cornerRadius(8)
            }
            .alert(isPresented: $presentedAlert) {
                return Alert(title: Text("Error!"),
                message: Text(errorMesssage!),
                dismissButton: .destructive(Text("OK")))
            }
            
            HStack {
                Text("No account?")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                Button(action: { self.presentedSignUpPage = true }) {
                    Text("Sign Up")
                        .foregroundColor(.blue)
                        .bold()
                        .font(.footnote)
                }
                .sheet(isPresented: self.$presentedSignUpPage) {
                    RegistrationView(presentedBinding: self.$presentedSignUpPage)
                }
            }
            EmptyView().fullScreenCover(isPresented: $presentedTabBarView, content: {
                TabBarView(session: session)
            })
        }
    }
}
