//
//  EventViewCell.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/15/20.
//

import SwiftUI
import SwipeableView

struct EventViewCell: View {
    @EnvironmentObject var session: SessionManager
    @EnvironmentObject var events: EventsList
    var event: Event_Event
    var eventIndex: Int
    var primaryColor: Color = Color.orange
    var container = SwManager()
    
    static let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
        formatter.dateFormat = "M/dd h:mm a"
            return formatter
        }()
    
    var body: some View {
        SwipeableView(content: {
            VStack(alignment: .leading) {
                Spacer()
                HStack {
                    Text(event.name).foregroundColor(primaryColor).font(.system(size: 16.0)).bold().lineLimit(1)
                    Spacer()
                    Text("Expires at \(EventViewCell.dateFormatter.string(from: Date.fromStr(timestamp: event.expiresAt)!))")
                        .foregroundColor(.gray).font(.system(size: 12.0))
                }.padding(.bottom, 5)
                HStack {
                    IconWithTextView(iconName: "person.2.fill", text: String(100)).foregroundColor(.green)
                    IconWithTextView(iconName: "dollarsign.circle.fill", text: String.toCurrencyStr(balance: event.remainingAmount) ?? "0.00").foregroundColor(AppColors.generalCoinForegroundColor)
                }
                Spacer()
            }
            .frame(maxHeight: .infinity)
            .cornerRadius(10)
            .padding(.horizontal)
        },
        leftActions: [Action(title: "Detail", iconName: "info.circle.fill", bgColor: .green, action: {
        }), Action(title: "Delete", iconName: "trash.fill", bgColor: .red, action: {
            session.eventManager?.deleteEvent(eventId: events.items[eventIndex].eventID, perform: { error in
                if error != nil {
                    print(error!)
                } else {
                    events.remove(i: eventIndex)
                }
            })
        })],
        rightActions: [],
        rounded: true,
        container: container)
        .frame(height: 100)
        .background(Color.white)
    }
}

struct IconWithTextView: View {
    var iconName: String
    var text: String
    var body: some View {
        HStack {
            Image(systemName: iconName)
            Text(text)
        }
    }
}

struct EventViewCell_Previews: PreviewProvider {
    static var previews: some View {
        Prev_Structx()
    }
}

struct Prev_Structx: View {
    @State var events = EventsList()
    @State var event = Event_Event()
    var body: some View {
        EventViewCell(event: event, eventIndex: 0).environmentObject(events)
    }
}
