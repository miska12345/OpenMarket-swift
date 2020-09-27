//
//  NewEventView.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 9/26/20.
//

import SwiftUI

struct NewEventView: View {
    @Binding var enable: Bool
    var body: some View {
        VStack {
            HStack {
                Text("New Event")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(.black)
                    .padding(.top)
                
                Spacer()
                
                Button(action: {
                    self.enable = false
                }) {
                    ZStack(alignment: .topTrailing) {
                        Image(systemName: "xmark.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25)
                            .foregroundColor(Color(#colorLiteral(red: 0.6621162891, green: 0.6699317694, blue: 0.7221717238, alpha: 1)))
                    }
                }
            }
            Divider()
            Image("asset1").resizable().aspectRatio(contentMode: .fit)
            EventTextField(iconName: "tag.circle.fill", placeholder: "Please enter your event name")
            EventDropDownPicker()
            EventTextField(iconName: "dollarsign.circle.fill", placeholder: "Please enter reward amount", isNumeric: true)
            EventTextField(iconName: "dollarsign.circle.fill", placeholder: "Please enter total amount", isNumeric: true)
            EventDatePicker()
            CartButton(title: "Create Event", backgroundColor: AppColors.generalBackgroundButtonColor, fontColor: AppColors.generalButtonForegroundColor,
                       perform: {
                        print("create")
            })
                .padding()
            Spacer()
        }.padding()
    }
}

//struct NewEventView_Previews: PreviewProvider {
//    @State var enable: Bool = false
//    static var previews: some View {
//        NewEventView(enable: $enable)
//    }
//}
