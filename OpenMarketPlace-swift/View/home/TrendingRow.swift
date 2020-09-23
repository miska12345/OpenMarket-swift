//
//  TrendingRow.swift
//  OpenMarketPlace-swift
//
//  Created by Weifeng Li on 9/21/20.
//

import SwiftUI

struct TrendingRow: View {
    @State var item: Item
    @State private var toDetailView: Int! = 0
    let organization: Organization
    var body: some View {
        HStack{
            NavigationLink(
                destination: ItemDetailView(item: item, org: organization),
                tag: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/,
                selection: $toDetailView) {
                EmptyView()
            }.buttonStyle(PlainButtonStyle())
            
            Button(action: {
                self.toDetailView = 1;
            }, label: {
                HStack (alignment: .center, spacing: 20, content: {
                    Image(item.imageName).resizable()
                        .renderingMode(.original)
                        .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .padding(.leading, 10)
                        .padding(.vertical, 10)
                    VStack {
                        Text(item.itemName).fontWeight(.heavy).multilineTextAlignment(.center).lineLimit(1)
                        Text(item.description).font(.system(size: 15))
                    }
                    Spacer()
                }).background(Color(Color.RGBColorSpace.sRGB, red: 251/255.0, green: 243/255.0, blue: 243/255.0, opacity: 0.94))
                .cornerRadius(15)
                .padding(.horizontal, 10)
            })
            .shadow(radius: 5)
            .foregroundColor(.black)
            .border(Color.white, width: 0)
        }
    }
}

//struct TrendingRow_Previews: PreviewProvider {
//    static var previews: some View {
//        TrendingRow(item: Item(imageName: "yeezy", itemName: "Yeezy 350", itemDescription: "yoyo", itemAbout: ["big"], itemPrice: 100), organization: org[0])
//    }
//}
