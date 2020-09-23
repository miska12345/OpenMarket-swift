//
//  HomeView.swift
//  OpenMarketPlace-swift
//
//  Created by Weifeng Li on 9/21/20.
//

import SwiftUI

struct HomeView: View {
    @State var data: [Item]
    @State var recommend: [Organization]
    @State var index = 0
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 15){
                    ImageSlideView(index: $index.animation(), maxIndex: org.count - 1, recommened: self.recommend)
                    .aspectRatio(4/3, contentMode: .fit)
                        
                    .background(Color(Color.RGBColorSpace.sRGB, red: 251/255.0, green: 243/255.0, blue: 243/255.0, opacity: 0.94))
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    
                    Text("Trending item").font(.title)
                        .padding(.leading, -200)
                    Divider()
                    VStack{
                        ForEach(staticData) { item in
                            //TODO change org[0] to some actual org
                            TrendingRow(item: item, organization: org[0])
                            Divider()
                        }
                    }
                    Spacer()
                }.padding(.horizontal, 15)
            }
            .padding(.top, 10)
            .navigationBarHidden(/*@START_MENU_TOKEN@*/false/*@END_MENU_TOKEN@*/)
            .navigationBarBackButtonHidden(true)
            .navigationBarTitle(Text("Home"), displayMode: .inline)
            .navigationBarItems(leading: Text("leading"))
        }
        
        
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(data: staticData, recommend: org)
    }
}

let staticData = [
    Item(id: "1", itemName: "kucf", price: 3.313, description: "aaaa", quantity: 2)
]

let org = [
    Organization(organizationName: "AA", organizationPicture: "cssa_logo", organizationDescription: "AA", organizationStoreItems: [Item](), organizationStoreCurrency: ["fuck coin"])
]

