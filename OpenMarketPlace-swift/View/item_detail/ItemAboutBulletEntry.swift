//
//  ItemAboutBulletList.swift
//  OpenMarketPlace-swift
//
//  Created by Weifeng Li on 9/22/20.
//

import SwiftUI

struct ItemDescriptionAndSeller: View{
    
    let itemAbout: [String]
    let itemDescription: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            Text("Description")
                .font(.title)
            Text(itemDescription)
                .font(.system(size: 20))
                .frame(width: 400, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Spacer()
        }
        .frame(width: 410, height: 100, alignment: .leading)
        .background(Color.white)
        
        
    }
}

struct ItemAboutBulletList_Previews: PreviewProvider {
    static var previews: some View {
       ItemDescriptionAndSeller(itemAbout: ["big","small", "warm"], itemDescription: "This is very big very small and very warm at the same time")
    }
}
