//
//  RegistrationView.swift
//  SwiftUI-LoginView
//
//  Created by ShangJIn Li on 24.09.2020.
//  Copyright © 2020 ShangJIn Li. All rights reserved.
//

import SwiftUI

enum ActiveAlert {
    case error, success
}

struct RegistrationView: View {
    @Binding var presentedBinding: Bool
    
    @State private var username = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    @State private var errorMessage: String?
    @State private var presentedAlert = false
    @State private var activeAlert: ActiveAlert = .error
    
    fileprivate func registration() {
        if password != confirmPassword {
            self.errorMessage = "Password mismatch!"
            self.presentedAlert = true
            return
        }
        AuthManager.shared.register(uname: username, pass: password, perform: { error in
            if error != nil {
                print("yup")
                self.errorMessage = error?.message
                self.activeAlert = .error
                self.presentedAlert = true
                return
            }
            self.activeAlert = .success
            self.presentedAlert = true
        })
        UIApplication.shared.endEditing()
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text("OPEN MARKET")
                    .font(.largeTitle)
                    .foregroundColor(Color(red: 0.7578, green: 0.6484, blue: 0.6484))
                Image("cart")
                    .resizable()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 80, alignment: .center)
                    .padding()
                
                Spacer()
                
                VStack {
                   GeneralTextField(string: $username,
                                 passwordMode: false,
                                 placeholder: "Enter your username",
                                 iconName: "person.crop.circle.fill")
                        .padding(.vertical, 8)
                    
                    GeneralTextField(string: $password,
                                  passwordMode: true,
                                  placeholder: "Enter your password",
                                  iconName: "lock.fill")
                        .padding(.vertical, 8)
                    
                    GeneralTextField(string: $confirmPassword,
                                  passwordMode: true,
                                  placeholder: "Confirm your password",
                                  iconName: "repeat")
                        .padding(.vertical, 8)
                }
                .padding(.vertical)
                
                Button(action: { self.registration() })
                {
                    Rectangle()
                        .fill(Color.init(#colorLiteral(red: 0.9098039269, green: 0.5668996837, blue: 0.6566165896, alpha: 1)))
                        .frame(height: 50, alignment: .center)
                        .overlay(Text("Continue").foregroundColor(.white).bold())
                        .cornerRadius(8)
                }
                .alert(isPresented: $presentedAlert) {
                    switch activeAlert {
                    case .error:
                        return Alert(title: Text("Error!"), message: Text(self.errorMessage!), dismissButton: .destructive(Text("OK")))
                    case .success:
                        return Alert(title: Text("Registration"),
                              message: Text("You have successfully registered with username \(self.username)."),
                            dismissButton: Alert.Button.default(
                                Text("OK"), action: { self.presentedBinding = false }
                            )
                        )
                    }
                }
            }
            .keyboardAdaptive()
            .padding(.horizontal, 30)
            .navigationBarItems(trailing: Button("Cancel") {
                self.presentedBinding = false
            })
        }
        .padding(.bottom)
        .padding(.bottom)
    }
}

