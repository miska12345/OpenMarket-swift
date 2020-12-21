//
//  OrgEventCell.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/20/20.
//

import SwiftUI

struct OrgEventCell: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack(alignment: .leading) {
                HStack {
                    Text("New Year Party")
//                        .font(.system(size: 25))
//                        .font(.title)
                        .fontWeight(.bold)
                        .minimumScaleFactor(1)
                        .lineLimit(1)
                    
                    Spacer()
                }
                Text("Dec 12, 2020 - Dec 13, 2020")
                    .fontWeight(.semibold)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                    .foregroundColor(AppColors.lightGray2)
                Spacer()
                Label {
                    Text("200")
                } icon: {
                    Image(systemName: "dollarsign.circle.fill")
                        .foregroundColor(.yellow)
                }
            }
            .padding()
            .frame(height: 150)
            .foregroundColor(.white)
            .background(LinearGradient(gradient: Gradient(colors: [AppColors.primaryColor, Color.yellow]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(20)
            
            Circle()
                .frame(width: 90, height: 90)
                .foregroundColor(Color.white.opacity(0.3))
                .offset(x: 10, y: 10)
            
        }
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: .gray, radius: 1, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
    }
}

struct OrgEventCell_Previews: PreviewProvider {
    static var previews: some View {
        OrgEventCell()
    }
}
