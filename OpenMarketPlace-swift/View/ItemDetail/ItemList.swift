////
////  ItemList.swift
////  OpenMarketPlace-swift
////
////  Created by Weifeng Li on 9/22/20.
////
//
//import SwiftUI
//
//struct ItemList: View {
//    var listName: String
//    var itemCollection: [Item]
//    let organization: Organization
//    @ObservedObject var session: SessionManager
//    var body: some View {
//        VStack{
//            Text(listName).font(.title)
//                .padding(.leading, -200)
//            
//            Divider()
//            VStack{
//                ForEach(itemCollection) { item in
//                    TrendingRow(item: item, organization: organization, session: session)
//                    Divider()
//                }
//            }
//        }
//    }
//}
//
////struct ItemList_Previews: PreviewProvider {
////    static var previews: some View {
////        ItemList(listName: "New List", itemCollection: staticData, organization: org[0])
////    }
////}
