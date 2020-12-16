//
//  EventPopUpControlView.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/15/20.
//

import SwiftUI

struct EventPopUpControlView: View {
    var body: some View {
        VStack {
            EventPopUpControlItemView(iconName: "qrcode.viewfinder", text: "Scan QR")
            Divider()
            EventPopUpControlItemView(iconName: "plus.square", text: "New Event")
        }.background(
            RoundedRectangle(cornerRadius:5).foregroundColor(Color.black).opacity(0.5)
                
        ).frame(width: 150, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        
    }
}

struct EventPopUpControlItemView: View {
    var iconName: String
    var text: String
    var body: some View {
        Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
            HStack {
                Image(systemName: iconName).foregroundColor(.white)
                Text(text).foregroundColor(.white)
                Spacer()
            }.padding(.horizontal)
            .padding(.bottom, 10)
            .padding(.top, 10)
        }
    }
}

struct EventPopUpControlView_Previews: PreviewProvider {
    static var previews: some View {
        EventPopUpControlView()
    }
}
