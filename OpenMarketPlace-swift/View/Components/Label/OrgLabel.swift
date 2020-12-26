//
//  OrgLabel.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/25/20.
//

import SwiftUI

struct OrgLabel: View {
    var body: some View {
        Label {
                            Text("Organization of Bubble Tea(2)")
                                .fontWeight(.semibold)
                                .lineLimit(1)
        } icon: {
            Image(systemName: "gamecontroller.fill")
                .foregroundColor(.white)
                .background(
                    AppColors.secondaryColor
                )
                .clipShape(Circle())
        }
    }
}

struct OrgLabel_Previews: PreviewProvider {
    static var previews: some View {
        OrgLabel()
    }
}
