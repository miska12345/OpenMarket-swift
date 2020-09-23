//
//  LoginView.swift
//  OpenMarketPlace-swift
//
//  Created by Shangrong Li on 9/21/20.
//

import SwiftUI

struct LoginView: View {
    @State var username: String = ""
    @State var password: String = ""
    var body: some View {
        ZStack {
            Color(red: 0.9547, green: 0.9297, blue: 0.9297).ignoresSafeArea()
            VStack(alignment: .center, spacing: nil, content: {
                Text("OPEN MARKET")
                    .font(.largeTitle)
                    .foregroundColor(Color(red: 0.7578, green: 0.6484, blue: 0.6484))
                Image("cart")
                    .resizable()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding()
                TextField("Username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .lineLimit(30)
                    .frame(width: 300, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                TextField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .lineLimit(30)
                    .frame(width: 300, height: 40, alignment: .center)

                Button(action: {
                    print("");
                }) {
                    RoundedRectangle(cornerRadius: 10.0)
                        .foregroundColor(.white)
                        .frame(width: 100, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .overlay(
                            Text("Log in").foregroundColor(Color(red: 0.7578, green: 0.6484, blue: 0.6484))
                        )
                        .cornerRadius(10.0)
                }.animation(.spring())
                .padding(.vertical)
                
                Button(action: {
                    print("");
                }) {
                    RoundedRectangle(cornerRadius: 10.0)
                        .foregroundColor(.white)
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .overlay(
                            Text("Register").foregroundColor(Color(red: 0.7578, green: 0.6484, blue: 0.6484))
                        )
                        .cornerRadius(10.0)
                }.animation(.spring())
            })
        }
        
        
    }
    
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
