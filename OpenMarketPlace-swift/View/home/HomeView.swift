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
                    ImageSlideView(index: $index.animation(), maxIndex: 2, recommened: self.recommend)
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

let staticData = [Item(imageName: "yeezy", itemName: "Yeezy 350", itemDescription: "This my yeezy,  it is really light and you will feel like skating on shit", itemAbout: ["big","small","warm"], itemPrice: 100),
                  Item(imageName: "COM", itemName: "COM NB", itemDescription: "COM is very nb desne", itemAbout: ["big","small","warm"], itemPrice: 100),
                  Item(imageName: "Ee", itemName: "Ee NB", itemDescription: "Ee is also very nb desne", itemAbout: ["big","small","warm"], itemPrice: 100),
                  Item(imageName: "Ee", itemName: "Ee NB", itemDescription: "Ee is also very nb desne", itemAbout: ["big","small","warm"], itemPrice: 100)]

let org = [Organization(organizationName: "UW CSSA", organizationPicture: "cssa_logo",organizationDescription: "This is a very big very small very warm club", organizationStoreItems: staticData, organizationStoreCurrency: nil),
           Organization(organizationName: "UW CSSA", organizationPicture: "cssa_logo",organizationDescription: "This is a very big very small very warm club", organizationStoreItems: staticData, organizationStoreCurrency: nil),
           Organization(organizationName: "UW CSSA", organizationPicture: "cssa_logo",organizationDescription: "This is a very big very small very warm club", organizationStoreItems: staticData, organizationStoreCurrency: nil)]

