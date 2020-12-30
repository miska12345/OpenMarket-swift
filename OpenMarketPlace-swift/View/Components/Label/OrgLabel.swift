//
//  OrgLabel.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/25/20.
//

import SwiftUI

struct OrgLabel: View {
    var orgName: String = "Organization of Bubble Tea"
    var body: some View {
        Label {
                            Text(orgName)
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
