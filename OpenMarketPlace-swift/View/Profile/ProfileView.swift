//
//  ProfileView.swift
//  OpenMarketPlace-swift
//
//  Created by Shangrong Li on 9/21/20.
//

import SwiftUI

struct ProfileView: View {
    var usernmae: String;
    var body: some View {

        ZStack{
            Color(red: 0.9547, green: 0.9297, blue: 0.9297).ignoresSafeArea()
            ScrollView{
                VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                    Image("eagle")
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 150, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .aspectRatio(1, contentMode: ContentMode.fit)

                    Text(usernmae)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .padding ()
                    Divider().padding(.bottom)
                    
                    ForEach (data, id:\.self) { str in
                        let img = Image("eagle")
                        OrgMinView(OrganizationName: str, OrgLogo: img)
                            .padding(.bottom, 1)
                    }
                })
            }
        }
        
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(usernmae: "JGod")
    }
}

let data = ["Organization of Hua ClassMate", "Organization of Tua ClassMate", "Organization of Jua ClassMate", "Organization of Kua ClassMate", "Organization of Dua ClassMate", "Organization of Zua ClassMate"]
