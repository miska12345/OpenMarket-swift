//
//  EventDetailView.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 9/25/20.
//

import SwiftUI

struct EventDetailView: View {
    @Binding var presentedBinding: Bool
    var event: Event_Event
    var body: some View {
        VStack(alignment: .trailing) {
            Spacer()
            VStack {
                Image("asset3")
                    .resizable()
                    .scaledToFit()
                Text("Successful")
                    .font(.title)
                    .bold()
                Text("+ \(String(format: "%.2f", event.rewardAmount))  \(event.currency.uppercased())").foregroundColor(Color(hex: 0xe67e22)).font(.system(size: 30))
                    .bold()
                    .padding(.vertical)
                    .padding(.horizontal, 30)
                    .multilineTextAlignment(.center)
            
                
                Text(event.successMessage)
                    .foregroundColor(.secondary)
                    .padding(.vertical)
                    .padding(.horizontal, 30)
                    .multilineTextAlignment(.center)
            } 
            
            Spacer()
            
            Button(action: {
                self.presentedBinding = false
            })
            {
                Rectangle()
                    .fill(AppColors.generalBackgroundButtonColor)
                    .frame(height: 50, alignment: .center)
                    .overlay(Text("Continue").foregroundColor(.white).bold())
                    .cornerRadius(8)
            }
            .padding(.vertical)
            .padding(.horizontal, 30)
        }
    }
}

//struct EventDetailView_Previews: PreviewProvider {
//    @State static var bool = true
//    static var previews: some View {
//        EventDetailView(presentedBinding: $bool)
//    }
//}
