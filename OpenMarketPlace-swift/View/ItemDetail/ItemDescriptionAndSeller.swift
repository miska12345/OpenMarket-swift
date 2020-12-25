////
////  ItemAboutBulletList.swift
////  OpenMarketPlace-swift
////
////  Created by Weifeng Li on 9/22/20.
////
//
//import SwiftUI
//
//struct ItemDescriptionAndSeller: View{
//    
//    let itemDescription: String
//    let organization: Organization
//    var body: some View {
//        VStack(alignment: .center, spacing: 10){
//            VStack(alignment: .leading){
//                Text("Description")
//                    .font(.title)
//                Text(itemDescription)
//                    .font(.system(size: 20))
//                    .multilineTextAlignment(.leading)
//                    .padding(.leading, 10)
//                    .padding(.top, 5)
//                    .padding(.bottom, 20)
//                Divider()
//                Text("About Seller").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
//            }.padding(.top)
//            
//            VStack(){
//                Image(organization.organizationPicture)
//                    .resizable()
//                    .frame(width: 150, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                    .clipShape(Circle())
//                Text(organization.organizationName)
//                    .fontWeight(.semibold)
//                    .padding(.top, -10)
//            }               
//                
//            VStack(alignment: .leading){
//                Text(organization.organizationDescription)
//                    .frame(width: 400, height: 100, alignment: .top)
//                    .padding(.top)
//                    .font(.system(size: 20))
//            }
//                
//                    
//            
//             
//        }
//        .padding(.leading, 10)
//        .background(Color.white)
//        
//        
//    }
//}
//
//struct ItemAboutBulletList_Previews: PreviewProvider {
//    static var previews: some View {
//       ItemDescriptionAndSeller(itemDescription: "This is very big very small and very warm at the same time", organization: org[0])
//    }
//}
