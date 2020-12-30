//
//  GeneralBackButton.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/20/20.
//

import SwiftUI

struct GeneralBackButton: View {
    @Environment(\.presentationMode) var presentationMode
    var text: String = "Back"
    var action: ()->Void = {}
    var dismissable: Bool = true
    var useSpacer: Bool = true
    
    var body: some View {
        HStack() {
            Label {
                Text(text)
                    .fontWeight(.semibold)
                    .lineLimit(1)
            } icon: {
                Image(systemName: "chevron.left")
            }.onTapGesture {
                print("Back")
                action()
                if dismissable {
                    dismiss()
                }
            }
            if useSpacer {
                Spacer()
            }
        }
    }
    
    func dismiss() {
        self.presentationMode.wrappedValue.dismiss()
    }
}

struct GeneralBackButton_Previews: PreviewProvider {
    static var previews: some View {
        GeneralBackButton()
    }
}
