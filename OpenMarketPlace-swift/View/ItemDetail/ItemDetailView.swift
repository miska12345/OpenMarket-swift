//
//  ItemDetailView.swift
//  OpenMarketPlace-swift
//
//  Created by Weifeng Li on 9/22/20.
//

import SwiftUI

struct ItemDetailView: View {
    @State var item : Item
    let org: Organization
    @State var itemSwift: [Item] = [Item]()
    @ObservedObject var session: SessionManager
    @State var itemPopulated = false;
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
                        .padding(.leading, 5)
                    Text("\(item.price, specifier: "%.2f")")
                        .font(.system(size: 40))
                }.padding(.leading, -180)
                Text("Pickup Only & In store only")
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .padding(.leading, -160)
                Divider()
                
                Button(action: {
                    var newItem = item.copy()
                    newItem.orderQuantity = 1
                    print(newItem)
                    session.cartManager?.addItemToCart(newItem: newItem)
                }, label: {
                    Text("Add to Cart").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).foregroundColor(.black)
                }).frame(width: 400, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(Color(Color.RGBColorSpace.sRGB, red: 251/255.0, green: 243/255.0, blue: 243/255.0, opacity: 0.94))
                .cornerRadius(15)                
                
                
                ItemDescriptionAndSeller(itemDescription: item.description, organization: org)
                //Todo add owner for items
                ItemList(listName: "Similar Item", itemCollection: itemSwift, organization: org, session: session)
            }.padding(.top, 40)
            .onAppear{
                if (!self.itemPopulated) {
                    self.session.marketplaceManager?.getSimilarItems(itemId: item.id, itemCategory: item.category, withCount: 5, perform: { (itemsGrpc, error) in
                        if (error == nil) {
                            for index in 0 ... (itemsGrpc!.count - 1){
                                let temp : Marketplace_ItemGrpc = itemsGrpc![index]
                                itemSwift.append(Item(id: temp.itemID, itemName: temp.itemName, price: temp.itemPrice, description: temp.itemDescription, orderQuantity: 0, stock: Int(temp.itemStock), category: temp.category, owner: temp.belongTo))
                            }
                            self.itemPopulated = true;
                        }
                    })
                }
            }
        }
        
    }
}

//struct ItemDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ItemDetailView(item: Item(imageName: "yeezy", itemName: "Yeezy 350 Cinder", itemDescription: "My yeezy feel like skating on ice and very smooth", itemAbout: ["big", "small", "warm"], itemPrice: 100), org: org[0])
//    }
//}
