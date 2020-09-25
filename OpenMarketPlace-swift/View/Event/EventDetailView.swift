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
                Text("You are in! $\(event.rewardAmount) \(event.currency) will be rewarded to your account shortly.")
                    .foregroundColor(.secondary)
                    .padding(.vertical)
                    .padding(.horizontal, 30)
                    .multilineTextAlignment(.center)
            }
            
            Spacer()
            
            Button(action: { self.presentedBinding = false })
            {
                Rectangle()
                    .fill(Color.init(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)))
                    .frame(height: 50, alignment: .center)
                    .overlay(Text("Continue").foregroundColor(.white).bold())
                    .cornerRadius(8)
            }
            .padding(.vertical)
            .padding(.horizontal, 30)
        }
    }
}
//
//struct EventDetailView_Previews: PreviewProvider {
//    @State static var bool = true
//    @State var event: Event_Event = Event_Event()
//    static var previews: some View {
//        EventDetailView(presentedBinding: $bool, event: $event)
//    }
//}
