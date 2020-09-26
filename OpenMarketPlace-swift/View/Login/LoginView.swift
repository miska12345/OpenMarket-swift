//
//  LoginView.swift
//  OpenMarketPlace-swift
//
//  Created by Shangrong Li on 9/21/20.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var session: SessionManager
    @State var username: String = "123"
    @State var password: String = "123"
    @State private var presentedPasswordReset = false
    @State private var presentedTabBarView = false
    
    var body: some View {
        ZStack {
            Color(red: 0.9547, green: 0.9297, blue: 0.9297).ignoresSafeArea()
            VStack(alignment: .center, spacing: nil, content: {
                Spacer()
                Text("OPEN MARKET")
                    .font(.largeTitle)
                    .foregroundColor(Color(red: 0.7578, green: 0.6484, blue: 0.6484))
                Image("cart")
                    .resizable()
                    .frame(width: 100, height: 80, alignment: .center)
                    .padding()
                VStack(alignment: .center) {
                    TextFieldView(string: self.$username,
                        passwordMode: false,
                        placeholder: "Enter your username",
                        iconName: "person.crop.circle.fill")
                        .padding(.vertical, 8)
                        
                    VStack(alignment: .trailing) {
                        TextFieldView(string: self.$password,
                            passwordMode: true,
                            placeholder: "Enter your password",
                            iconName: "lock.fill")
                        
                        Button(action: { self.presentedPasswordReset = true }) {
                            Text("Forgot password?")
                                .foregroundColor(Color.blue)
                                .bold()
                                .font(.footnote)
                        }
                        .sheet(isPresented: $presentedPasswordReset) {
                            Text("Not yet implemented")
                        }
                    }
                    .padding(.vertical, 8)
                    LoginButtons(session: session, bindUsername: $username,
                                 bindPassword: $password)
                }
                Spacer()
            })
            .padding(.top)
            .padding(.horizontal, 30)
        }
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(session: SessionManager())
    }
}
