//
//  ItemDetailView.swift
//  OpenMarketPlace-swift
//
//  Created by Weifeng Li on 9/22/20.
//

import SwiftUI

struct ItemDetailView: View {
    let item : Item
    let org: Organization
    var body: some View {
        
        ScrollView {
            VStack(alignment: .center, spacing: 20){
                Text(item.itemName)
                    .foregroundColor(.gray)
                Image(item.imageName)
                    .resizable()
                    .frame(width: 410, height: 300, alignment: .center)
                HStack(spacing: 3) {
                    //TODO change to coin image later
                    Text("$").font(.system(size: 20))
                        .padding(.bottom, 20)
                    Text("\(item.itemPrice)")
                        .font(.system(size: 40))
                }.padding(.leading, -180)
                
                Text("Pickup Only & In store only")
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .padding(.leading, -160)
                Divider()
                
                Button(action: {
                    
                }, label: {
                    Text("Add to Cart").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).foregroundColor(.black)
                }).frame(width: 400, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(Color(Color.RGBColorSpace.sRGB, red: 251/255.0, green: 243/255.0, blue: 243/255.0, opacity: 0.94))
                .cornerRadius(15)                
                
                
                ItemDescriptionAndSeller(itemAbout: item.itemAbout, itemDescription: item.itemDescription, organization: org)
                //Todo change org[0] to some actual organization
                ItemList(listName: "Similar Item", itemCollection: staticData, organization: org)
            }.padding(.top, 40)
        }
        
    }
}

struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailView(item: Item(imageName: "yeezy", itemName: "Yeezy 350 Cinder", itemDescription: "My yeezy feel like skating on ice and very smooth", itemAbout: ["big", "small", "warm"], itemPrice: 100), org: org[0])
    }
}
