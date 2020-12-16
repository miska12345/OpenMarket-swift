//
//  EventDropDownPicker.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 9/26/20.
//

import SwiftUI

struct EventDropDownPicker: View {
    @Binding var currentCoinSelected: String
    @ObservedObject var currenciesDict: DictModel
    @State var title = "Select a Currency"
    @State var disclosureEnabled = false
    var body: some View {
        VStack {
            DisclosureGroup(isExpanded: $disclosureEnabled) {
                ForEach(currenciesDict.dict.sorted(by: <), id: \.key) { key, value in
                    CurrencyPickerItem(currentCoinSelected: $currentCoinSelected, disclosureGroupEnabled: $disclosureEnabled, backgroundColor: Color.green, currency: key, amount: value)
                }
            } label: {
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "dollarsign.circle.fill")
                            .foregroundColor(AppColors.generalCoinForegroundColor)
                            .padding(.vertical, 20)
                            .padding(.trailing, 5)
                        Text(currentCoinSelected.elementsEqual("") ? "Select a Currency" : currentCoinSelected)
                            .foregroundColor(.gray)
                            .padding(.trailing)
    //                    Image(systemName: "chevron.down").padding()
                    }
                }
    //            .background(
    //                RoundedRectangle(cornerRadius: 10)
    //                    .fill(Color.init(#colorLiteral(red: 0.9568627451, green: 0.9647058824, blue: 0.9764705882, alpha: 1))))
    //            .frame(maxWidth: .infinity)
            }.padding(.horizontal, 20)
        }
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.init(#colorLiteral(red: 0.9568627451, green: 0.9647058824, blue: 0.9764705882, alpha: 1))))
        
//
//        Button(action: {
//            print("a")
//        }) {
//            VStack(alignment: .leading) {
//                HStack {
//                    Image(systemName: "dollarsign.circle.fill")
//                        .foregroundColor(Color.init(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)))
//                        .padding(.vertical, 20)
//                        .padding(.trailing, 5)
//                        .padding(.leading, 20)
//                    Text("Select a Currency")
//                        .foregroundColor(.gray)
//                        .padding(.trailing)
//                    Spacer()
//                    Image(systemName: "chevron.down").padding()
//                }
//            }
//            .background(
//                RoundedRectangle(cornerRadius: 10)
//                    .fill(Color.init(#colorLiteral(red: 0.9568627451, green: 0.9647058824, blue: 0.9764705882, alpha: 1))))
//            .frame(maxWidth: .infinity)
//        }
    }
}

struct EventDropDownPicker_Previews: PreviewProvider {
    static var previews: some View {
        Pre_Struct()
    }
}

struct Pre_Struct: View {
    @State var currentSelection = ""
    
    @ObservedObject var dict: DictModel = DictModel()
    var body: some View  {
        EventDropDownPicker(currentCoinSelected: $currentSelection, currenciesDict: dict)
    }
}
