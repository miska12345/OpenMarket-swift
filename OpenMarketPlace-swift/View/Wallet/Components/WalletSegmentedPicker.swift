//
//  WalletSegmentedPicker.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/16/20.
//

import SwiftUI

struct WalletSegmentedPicker: View {
    @State var selection: Int = 0
    var body: some View {
        VStack {
            SegmentControl(selection: $selection, items: [SegmentItem(selectionIndex: 0, title: "Currency", colorOnSelect: AppColors.primaryColor, colorOnUnselect: Color.gray, colorForUnderline: AppColors.primaryColor),
                                                          SegmentItem(selectionIndex: 1, title: "History", colorOnSelect: AppColors.primaryColor, colorOnUnselect: Color.gray)
            ])
        }
    }
}

struct WalletSegmentedPicker_Previews: PreviewProvider {
    static var previews: some View {
        WalletSegmentedPicker()
    }
}

struct SegmentControl : View {
    @Binding var selection : Int
    var items : [SegmentItem]
    var backgroundColor: Color = Color.white

    var body : some View {
        return HStack(spacing: 5) {
            ForEach (items, id: \.self) { item in
                WalletSegmentButton(selection: $selection, selectionIndex: item.selectionIndex, text: item.title, colorOnSelected: item.colorOnSelect, colorOnUnselected: item.colorOnUnselect, colorForUnderline: item.colorForUnderline).padding()
                
            }
            
        }.font(.body)
//        .background(backgroundColor)
        .cornerRadius(10.0)
        
    }
}


struct WalletSegmentButton: View {
    @Binding var selection: Int
    var selectionIndex: Int = 0
    var text: String = "Currencies"
    var colorOnSelected: Color = Color.black
    var colorOnUnselected: Color = Color.gray
    var colorForUnderline: Color = Color.gray
    var underline: Bool = true
    var body: some View {
        Button(action: {
            self.selection = selectionIndex
        }) {
            VStack(alignment: .leading) {
                Text(text).font(Font.body.weight(selection == selectionIndex ? .bold : .regular)).foregroundColor(selection == selectionIndex ? colorOnSelected : colorOnUnselected)
                Rectangle().frame(height: selection == selectionIndex ? 3 : 0)
                    .padding(.horizontal, 5).foregroundColor(colorForUnderline)
                    .frame(width: 30)
            }
        }

    }
}

struct SegmentItem : Hashable {
    var selectionIndex = 0
    var title : String = ""
    var colorOnSelect : Color = AppColors.primaryColor
    var colorOnUnselect: Color = Color.gray
    var colorForUnderline = AppColors.primaryColor
}
