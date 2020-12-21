//
//  OrgNavLink.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/20/20.
//

import SwiftUI

struct OrgNavLink: View {
    var title: String = "Events"
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 18, weight: .semibold))
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(AppColors.darkGray)
        }
        .onTapGesture {
            print("Tapped")
        }
    }
}

struct OrgNavLink_Previews: PreviewProvider {
    static var previews: some View {
        OrgNavLink()
    }
}
