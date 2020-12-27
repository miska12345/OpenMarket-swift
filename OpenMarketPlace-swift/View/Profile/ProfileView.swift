//
//  ProfileView.swift
//  OpenMarketPlace-swift
//
//  Created by Shangrong Li on 9/21/20.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var session: SessionManager
    @EnvironmentObject var viewModel: TabBarModel
    var body: some View {
        NavigationView {
            ZStack {
                AppColors.lightGray.edgesIgnoringSafeArea(.all)
                VStack (spacing: 0) {
                    HStack {
                        Text("Account")
                            .font(.title2)
                    }
                    ScrollView {
                        VStack {
                            InfoCell()
                            NavigationLink(
                                destination: NewWalletView(session: session),
                                label: {
                                    NavButtonWithBackground(text: "My Wallet")
                                }).buttonStyle(PlainButtonStyle())
                            
                            NavigationLink(
                                destination: OrderView(),
                                label: {
                                    NavButtonWithBackground(text: "My Orders")
                                }).buttonStyle(PlainButtonStyle())
                            NavButtonWithBackground(text: "My Organizations")
                            NavPanelForOpenMarket()
                            HStack {
                                Spacer()
                                Text("Log Out")
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color.gray)
                                Spacer()
                            }
                            .frame(height: 50)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .onTapGesture {
                                self.viewModel.showTabbarView()
                            }
                            Spacer()
                        }.padding()
                    }
                }
            }
            .navigationBarTitle("Account")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
        }
    }
    
    struct NavPanelForOpenMarket: View {
        var body: some View {
            VStack (spacing: 25) {
                NavButton(text: "Help Center")
                NavButton(text: "About OpenMarket")
            }.padding()
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
    
    struct NavButtonWithBackground: View {
        var text: String = "My Wallet"
        var body: some View {
            NavButton(text: text).padding().background(Color.white).clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
    
    struct InfoCell: View {
        var body: some View {
            HStack {
                Image("DefaultAvatar_Male")
                    .resizable()
                    .frame(width: 75, height: 75, alignment: .center)
                    .scaledToFit()
                VStack (alignment: .leading) {
                    Text("Miska")
                        .font(.system(size: 20))
                        .bold()
                        .minimumScaleFactor(0.5)
                        .lineLimit(1)
                        .scaledToFit()
                    Text("ID: miska123")
                        .lineLimit(1)
                }
                Spacer()
                Image(systemName: "chevron.right")
            }.padding()
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
