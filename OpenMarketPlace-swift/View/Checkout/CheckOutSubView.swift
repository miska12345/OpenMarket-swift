//
//  CheckOutSubView.swift
//  OpenMarketPlace-swift
//
//  Created by Weifeng Li on 9/26/20.
//

import SwiftUI

struct CheckOutSubView: View {
    @Binding var unprocessed:[Item]
    @Binding var checkoutMesssge: String
    @Binding var showSheet: Bool
    var body: some View{
        VStack{
            Text(checkoutMesssge)
                .bold()
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            switch(checkoutMesssge) {
                case "Success", "Success, the following items are out of stock":
                    Image("checked")
                        .resizable()
                        .frame(width: 300, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .scaledToFit()
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        .padding(.top, 80)
                default:
                    Image("triangle")
                        .resizable()
                        .frame(width: 150, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .scaledToFit()
            }

            List(unprocessed) {item in
                VStack{
                    HStack{
                        Image(systemName: "minus")
                            .foregroundColor(Color(hex: 0xe67e22))
                        Text("\(item.itemName)")
                            .foregroundColor(Color(hex: 0xe67e22))
                            .font(.system(size: 30))
                    }
                    HStack{
                        Text("Quanity: ")
                            .foregroundColor(Color(hex: 0x0c2461))
                        Text("\(item.orderQuantity)")
                    }
                }


            }
            .shadow(radius: 10)
            .padding(.all, 20)

            GeneralButton(title: "OK") {
                self.showSheet = false
            }.padding()
            .padding([.horizontal], 5)
            Spacer()

        }
    }
}


//struct CheckOutSubView_Previews: PreviewProvider {
//    @State var isEnabled = false
//    static var previews: some View {
//        CheckOutSubView(unprocessed: [Item(id: "xx", itemName: "Amazing", price: 1.0, description: "Mac Book Pro", orderQuantity: 3, stock: 0, category: "category", owner: "ChaCha"), Item(id: "xx", itemName: "Amazing", price: 1.0, description: "Mac Book Pro", orderQuantity: 3, stock: 0, category: "category", owner: "ChaCha")], checkoutMesssge: "Checkout Failed")
//    }
//}
