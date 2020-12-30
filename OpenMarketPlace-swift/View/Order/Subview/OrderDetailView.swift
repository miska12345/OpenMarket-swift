//
//  OrderDetailView.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/26/20.
//

import SwiftUI

struct OrderDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    var order: Marketplace_Order = Marketplace_Order()
    
    var body: some View {
        ZStack {
            AppColors.lightGray.edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack (alignment: .leading, spacing: 20) {
                    OrderDeliveryInfo(status: getOrderStatus())
                    OrderDetail(order: order)
                    Spacer()
                }
            }.padding(.horizontal)
        }
         .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: GeneralBackButton())
        .navigationBarTitle("Order Detail")
    }
    
    func getOrderStatus() -> OrderDeliveryInfo.Status {
        switch order.status {
        case .pendingPayment:
            return OrderDeliveryInfo.STATUS_PENDING_PAYMENT
        case .paymentConfirmed:
            return OrderDeliveryInfo.STATUS_PAYMENT_CONFIRMED
        default:
            return OrderDeliveryInfo.STATUS_PAYMENT_ERROR
        }
    }
    
    struct OrderDetail: View {
        var order: Marketplace_Order = Marketplace_Order()
        
        static let dateFormatter: DateFormatter = {
                let formatter = DateFormatter()
            formatter.dateFormat = "EE, MMM d, yyyy"
                return formatter
            }()
        
        var body: some View {
            VStack (alignment: .leading) {
                Text("Order details")
                    .font(.headline)
                VStack(spacing: 10) {
                    getDetailLabel(key: "Order number", value: order.orderID)
                    getDetailLabel(key: "Order total", value: "\(String.toCurrencyStr(balance: order.totalAmount, useSymbol: true) ?? "-") \(order.currency)")
                    getDetailLabel(key: "Order date", value: "\(String(describing: OrderDetail.dateFormatter.string(from: Date.fromStr(timestamp: order.createdAt) ?? Date())))")
                    getDetailLabel(key: "Seller ID", value: order.sellerID)
                    getDetailLabel(key: "Transaction ID", value: order.transactionID)
                    getDetailLabel(key: "Notes", value: "Peace")
                }
                .padding()
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            
        }
        
        func getDetailLabel(key: String, value: String) -> some View {
            HStack (alignment: .top) {
                Text(key)
                    .fontWeight(.light)
                Spacer()
                Text(value)
                    .multilineTextAlignment(.trailing)
                    
            }
        }
    }
    
    struct OrderDeliveryInfo: View {
        struct Status {
            var status: String = "Pending Payment"
            var foregroundColor: Color = Color.orange
            var tips: String = "Your order has been placed! The items will be delivered to you shortly."
        }
        static var STATUS_PENDING_PAYMENT = Status(status: "Processing", foregroundColor: .orange, tips: "You order is being processed. Please check back later for update.")
        static var STATUS_PAYMENT_CONFIRMED = Status(status: "Order Received", foregroundColor: .green)
        static var STATUS_PAYMENT_ERROR = Status(status: "Payment Error", foregroundColor: .red, tips: "Your order has not been placed! Please check wallet for more info.")
        
        var status: Status = STATUS_PENDING_PAYMENT
        var body: some View {
            VStack (alignment: .trailing) {
                HStack(alignment: .top) {
                    Image("delivery")
                        .resizable()
                        .frame(width: 80, height: 80, alignment: .center)
                        .scaledToFit()
//                    Spacer()
                    VStack (alignment: .leading) {
                        Text("Status: \(status.status)")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(status.foregroundColor)
                        Text(status.tips)
                            .font(.system(size: 15))
                            .fontWeight(.light)
                            .lineLimit(2)
                            .frame(minHeight: 45)
                    }
                    Spacer()
                }
                Text("Report an issue")
                    .fontWeight(.light)
                    .foregroundColor(Color.black)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1)
                    )
            }
            .padding()
            .frame(height: 150)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}

struct OrderDetailView_Previews: PreviewProvider {
    static var previews: some View {
        OrderDetailView()
    }
}
