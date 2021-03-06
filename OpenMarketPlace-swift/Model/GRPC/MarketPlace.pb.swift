// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: MarketPlace.proto
//
// For information on using the generated types, please see the documenation:
//   https://github.com/apple/swift-protobuf/

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that your are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

enum Marketplace_FailedCheckOutCause: SwiftProtobuf.Enum {
  typealias RawValue = Int
  case outOfStock // = 0
  case itemDoesNotExist // = 1
  case insufficientBalance // = 2
  case illegalArgument // = 3
  case UNRECOGNIZED(Int)

  init() {
    self = .outOfStock
  }

  init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .outOfStock
    case 1: self = .itemDoesNotExist
    case 2: self = .insufficientBalance
    case 3: self = .illegalArgument
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  var rawValue: Int {
    switch self {
    case .outOfStock: return 0
    case .itemDoesNotExist: return 1
    case .insufficientBalance: return 2
    case .illegalArgument: return 3
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension Marketplace_FailedCheckOutCause: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  static var allCases: [Marketplace_FailedCheckOutCause] = [
    .outOfStock,
    .itemDoesNotExist,
    .insufficientBalance,
    .illegalArgument,
  ]
}

#endif  // swift(>=4.2)

enum Marketplace_OrderStatus: SwiftProtobuf.Enum {
  typealias RawValue = Int
  case pendingPayment // = 0
  case paymentConfirmed // = 1
  case paymentNotReceived // = 2
  case cancelled // = 3
  case UNRECOGNIZED(Int)

  init() {
    self = .pendingPayment
  }

  init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .pendingPayment
    case 1: self = .paymentConfirmed
    case 2: self = .paymentNotReceived
    case 3: self = .cancelled
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  var rawValue: Int {
    switch self {
    case .pendingPayment: return 0
    case .paymentConfirmed: return 1
    case .paymentNotReceived: return 2
    case .cancelled: return 3
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension Marketplace_OrderStatus: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  static var allCases: [Marketplace_OrderStatus] = [
    .pendingPayment,
    .paymentConfirmed,
    .paymentNotReceived,
    .cancelled,
  ]
}

#endif  // swift(>=4.2)

enum Marketplace_Role: SwiftProtobuf.Enum {
  typealias RawValue = Int
  case buyer // = 0
  case seller // = 1
  case UNRECOGNIZED(Int)

  init() {
    self = .buyer
  }

  init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .buyer
    case 1: self = .seller
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  var rawValue: Int {
    switch self {
    case .buyer: return 0
    case .seller: return 1
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension Marketplace_Role: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  static var allCases: [Marketplace_Role] = [
    .buyer,
    .seller,
  ]
}

#endif  // swift(>=4.2)

enum Marketplace_Error: SwiftProtobuf.Enum {
  typealias RawValue = Int
  case none // = 0
  case internalServiceError // = 1
  case UNRECOGNIZED(Int)

  init() {
    self = .none
  }

  init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .none
    case 1: self = .internalServiceError
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  var rawValue: Int {
    switch self {
    case .none: return 0
    case .internalServiceError: return 1
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension Marketplace_Error: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  static var allCases: [Marketplace_Error] = [
    .none,
    .internalServiceError,
  ]
}

#endif  // swift(>=4.2)

struct Marketplace_GetOrgItemsRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var orgID: String = String()

  var exclusiveStartKey: String = String()

  var maxCount: Int32 = 0

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Marketplace_GetOrgItemsResult {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var error: Marketplace_GetOrgItemsResult.GetOrgItemsError = .none

  var lastEvaluatedKey: String = String()

  var items: [Marketplace_MarketPlaceItem] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  enum GetOrgItemsError: SwiftProtobuf.Enum {
    typealias RawValue = Int
    case none // = 0
    case orgDoesNotExist // = 1
    case UNRECOGNIZED(Int)

    init() {
      self = .none
    }

    init?(rawValue: Int) {
      switch rawValue {
      case 0: self = .none
      case 1: self = .orgDoesNotExist
      default: self = .UNRECOGNIZED(rawValue)
      }
    }

    var rawValue: Int {
      switch self {
      case .none: return 0
      case .orgDoesNotExist: return 1
      case .UNRECOGNIZED(let i): return i
      }
    }

  }

  init() {}
}

#if swift(>=4.2)

extension Marketplace_GetOrgItemsResult.GetOrgItemsError: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  static var allCases: [Marketplace_GetOrgItemsResult.GetOrgItemsError] = [
    .none,
    .orgDoesNotExist,
  ]
}

#endif  // swift(>=4.2)

struct Marketplace_GetAllOrdersRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var role: Marketplace_Role = .buyer

  var exclusiveStartKey: String = String()

  var maxCount: Int32 = 0

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Marketplace_GetAllOrdersResult {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var lastEvaluatedKey: String = String()

  var orders: [Marketplace_Order] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Marketplace_CheckOutRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var items: Dictionary<Int32,Int32> = [:]

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Marketplace_CheckOutResult {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var error: Marketplace_Error = .none

  var successOrders: [Marketplace_Order] = []

  var failedItems: Dictionary<Int32,Marketplace_FailedCheckOutCause> = [:]

  var actionRequiredOrders: [Marketplace_Order] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Marketplace_Order {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var orderID: String = String()

  var buyerID: String = String()

  var sellerID: String = String()

  var currency: String = String()

  var transactionID: String = String()

  var status: Marketplace_OrderStatus = .pendingPayment

  var totalAmount: Double = 0

  var createdAt: String = String()

  var lastUpdatedAt: String = String()

  var items: [Marketplace_OrderedItem] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Marketplace_OrderedItem {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var itemID: Int32 = 0

  var quantity: Int32 = 0

  var itemName: String = String()

  var itemPrice: Double = 0

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Marketplace_MarketPlaceItem {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var itemID: Int32 = 0

  var itemName: String = String()

  var itemImageLink: String = String()

  var itemDescription: String = String()

  var itemPrice: Double = 0

  var itemStock: UInt32 = 0

  var belongTo: String = String()

  var category: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "marketplace"

extension Marketplace_FailedCheckOutCause: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "OUT_OF_STOCK"),
    1: .same(proto: "ITEM_DOES_NOT_EXIST"),
    2: .same(proto: "INSUFFICIENT_BALANCE"),
    3: .same(proto: "ILLEGAL_ARGUMENT"),
  ]
}

extension Marketplace_OrderStatus: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "PENDING_PAYMENT"),
    1: .same(proto: "PAYMENT_CONFIRMED"),
    2: .same(proto: "PAYMENT_NOT_RECEIVED"),
    3: .same(proto: "CANCELLED"),
  ]
}

extension Marketplace_Role: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "BUYER"),
    1: .same(proto: "SELLER"),
  ]
}

extension Marketplace_Error: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "NONE"),
    1: .same(proto: "INTERNAL_SERVICE_ERROR"),
  ]
}

extension Marketplace_GetOrgItemsRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".GetOrgItemsRequest"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "orgId"),
    2: .same(proto: "exclusiveStartKey"),
    3: .same(proto: "maxCount"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.orgID)
      case 2: try decoder.decodeSingularStringField(value: &self.exclusiveStartKey)
      case 3: try decoder.decodeSingularInt32Field(value: &self.maxCount)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.orgID.isEmpty {
      try visitor.visitSingularStringField(value: self.orgID, fieldNumber: 1)
    }
    if !self.exclusiveStartKey.isEmpty {
      try visitor.visitSingularStringField(value: self.exclusiveStartKey, fieldNumber: 2)
    }
    if self.maxCount != 0 {
      try visitor.visitSingularInt32Field(value: self.maxCount, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Marketplace_GetOrgItemsRequest, rhs: Marketplace_GetOrgItemsRequest) -> Bool {
    if lhs.orgID != rhs.orgID {return false}
    if lhs.exclusiveStartKey != rhs.exclusiveStartKey {return false}
    if lhs.maxCount != rhs.maxCount {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Marketplace_GetOrgItemsResult: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".GetOrgItemsResult"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "error"),
    2: .same(proto: "lastEvaluatedKey"),
    3: .same(proto: "items"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularEnumField(value: &self.error)
      case 2: try decoder.decodeSingularStringField(value: &self.lastEvaluatedKey)
      case 3: try decoder.decodeRepeatedMessageField(value: &self.items)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.error != .none {
      try visitor.visitSingularEnumField(value: self.error, fieldNumber: 1)
    }
    if !self.lastEvaluatedKey.isEmpty {
      try visitor.visitSingularStringField(value: self.lastEvaluatedKey, fieldNumber: 2)
    }
    if !self.items.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.items, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Marketplace_GetOrgItemsResult, rhs: Marketplace_GetOrgItemsResult) -> Bool {
    if lhs.error != rhs.error {return false}
    if lhs.lastEvaluatedKey != rhs.lastEvaluatedKey {return false}
    if lhs.items != rhs.items {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Marketplace_GetOrgItemsResult.GetOrgItemsError: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "NONE"),
    1: .same(proto: "ORG_DOES_NOT_EXIST"),
  ]
}

extension Marketplace_GetAllOrdersRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".GetAllOrdersRequest"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "role"),
    2: .same(proto: "exclusiveStartKey"),
    3: .same(proto: "maxCount"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularEnumField(value: &self.role)
      case 2: try decoder.decodeSingularStringField(value: &self.exclusiveStartKey)
      case 3: try decoder.decodeSingularInt32Field(value: &self.maxCount)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.role != .buyer {
      try visitor.visitSingularEnumField(value: self.role, fieldNumber: 1)
    }
    if !self.exclusiveStartKey.isEmpty {
      try visitor.visitSingularStringField(value: self.exclusiveStartKey, fieldNumber: 2)
    }
    if self.maxCount != 0 {
      try visitor.visitSingularInt32Field(value: self.maxCount, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Marketplace_GetAllOrdersRequest, rhs: Marketplace_GetAllOrdersRequest) -> Bool {
    if lhs.role != rhs.role {return false}
    if lhs.exclusiveStartKey != rhs.exclusiveStartKey {return false}
    if lhs.maxCount != rhs.maxCount {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Marketplace_GetAllOrdersResult: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".GetAllOrdersResult"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "lastEvaluatedKey"),
    2: .same(proto: "orders"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.lastEvaluatedKey)
      case 2: try decoder.decodeRepeatedMessageField(value: &self.orders)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.lastEvaluatedKey.isEmpty {
      try visitor.visitSingularStringField(value: self.lastEvaluatedKey, fieldNumber: 1)
    }
    if !self.orders.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.orders, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Marketplace_GetAllOrdersResult, rhs: Marketplace_GetAllOrdersResult) -> Bool {
    if lhs.lastEvaluatedKey != rhs.lastEvaluatedKey {return false}
    if lhs.orders != rhs.orders {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Marketplace_CheckOutRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".CheckOutRequest"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "items"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeMapField(fieldType: SwiftProtobuf._ProtobufMap<SwiftProtobuf.ProtobufInt32,SwiftProtobuf.ProtobufInt32>.self, value: &self.items)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.items.isEmpty {
      try visitor.visitMapField(fieldType: SwiftProtobuf._ProtobufMap<SwiftProtobuf.ProtobufInt32,SwiftProtobuf.ProtobufInt32>.self, value: self.items, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Marketplace_CheckOutRequest, rhs: Marketplace_CheckOutRequest) -> Bool {
    if lhs.items != rhs.items {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Marketplace_CheckOutResult: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".CheckOutResult"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "error"),
    2: .same(proto: "successOrders"),
    3: .same(proto: "failedItems"),
    4: .same(proto: "actionRequiredOrders"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularEnumField(value: &self.error)
      case 2: try decoder.decodeRepeatedMessageField(value: &self.successOrders)
      case 3: try decoder.decodeMapField(fieldType: SwiftProtobuf._ProtobufEnumMap<SwiftProtobuf.ProtobufInt32,Marketplace_FailedCheckOutCause>.self, value: &self.failedItems)
      case 4: try decoder.decodeRepeatedMessageField(value: &self.actionRequiredOrders)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.error != .none {
      try visitor.visitSingularEnumField(value: self.error, fieldNumber: 1)
    }
    if !self.successOrders.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.successOrders, fieldNumber: 2)
    }
    if !self.failedItems.isEmpty {
      try visitor.visitMapField(fieldType: SwiftProtobuf._ProtobufEnumMap<SwiftProtobuf.ProtobufInt32,Marketplace_FailedCheckOutCause>.self, value: self.failedItems, fieldNumber: 3)
    }
    if !self.actionRequiredOrders.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.actionRequiredOrders, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Marketplace_CheckOutResult, rhs: Marketplace_CheckOutResult) -> Bool {
    if lhs.error != rhs.error {return false}
    if lhs.successOrders != rhs.successOrders {return false}
    if lhs.failedItems != rhs.failedItems {return false}
    if lhs.actionRequiredOrders != rhs.actionRequiredOrders {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Marketplace_Order: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Order"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "orderId"),
    2: .same(proto: "buyerId"),
    3: .same(proto: "sellerId"),
    4: .same(proto: "currency"),
    5: .same(proto: "transactionId"),
    6: .same(proto: "status"),
    7: .same(proto: "totalAmount"),
    8: .same(proto: "createdAt"),
    9: .same(proto: "lastUpdatedAt"),
    10: .same(proto: "items"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.orderID)
      case 2: try decoder.decodeSingularStringField(value: &self.buyerID)
      case 3: try decoder.decodeSingularStringField(value: &self.sellerID)
      case 4: try decoder.decodeSingularStringField(value: &self.currency)
      case 5: try decoder.decodeSingularStringField(value: &self.transactionID)
      case 6: try decoder.decodeSingularEnumField(value: &self.status)
      case 7: try decoder.decodeSingularDoubleField(value: &self.totalAmount)
      case 8: try decoder.decodeSingularStringField(value: &self.createdAt)
      case 9: try decoder.decodeSingularStringField(value: &self.lastUpdatedAt)
      case 10: try decoder.decodeRepeatedMessageField(value: &self.items)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.orderID.isEmpty {
      try visitor.visitSingularStringField(value: self.orderID, fieldNumber: 1)
    }
    if !self.buyerID.isEmpty {
      try visitor.visitSingularStringField(value: self.buyerID, fieldNumber: 2)
    }
    if !self.sellerID.isEmpty {
      try visitor.visitSingularStringField(value: self.sellerID, fieldNumber: 3)
    }
    if !self.currency.isEmpty {
      try visitor.visitSingularStringField(value: self.currency, fieldNumber: 4)
    }
    if !self.transactionID.isEmpty {
      try visitor.visitSingularStringField(value: self.transactionID, fieldNumber: 5)
    }
    if self.status != .pendingPayment {
      try visitor.visitSingularEnumField(value: self.status, fieldNumber: 6)
    }
    if self.totalAmount != 0 {
      try visitor.visitSingularDoubleField(value: self.totalAmount, fieldNumber: 7)
    }
    if !self.createdAt.isEmpty {
      try visitor.visitSingularStringField(value: self.createdAt, fieldNumber: 8)
    }
    if !self.lastUpdatedAt.isEmpty {
      try visitor.visitSingularStringField(value: self.lastUpdatedAt, fieldNumber: 9)
    }
    if !self.items.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.items, fieldNumber: 10)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Marketplace_Order, rhs: Marketplace_Order) -> Bool {
    if lhs.orderID != rhs.orderID {return false}
    if lhs.buyerID != rhs.buyerID {return false}
    if lhs.sellerID != rhs.sellerID {return false}
    if lhs.currency != rhs.currency {return false}
    if lhs.transactionID != rhs.transactionID {return false}
    if lhs.status != rhs.status {return false}
    if lhs.totalAmount != rhs.totalAmount {return false}
    if lhs.createdAt != rhs.createdAt {return false}
    if lhs.lastUpdatedAt != rhs.lastUpdatedAt {return false}
    if lhs.items != rhs.items {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Marketplace_OrderedItem: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".OrderedItem"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "itemId"),
    2: .same(proto: "quantity"),
    3: .same(proto: "itemName"),
    4: .same(proto: "itemPrice"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularInt32Field(value: &self.itemID)
      case 2: try decoder.decodeSingularInt32Field(value: &self.quantity)
      case 3: try decoder.decodeSingularStringField(value: &self.itemName)
      case 4: try decoder.decodeSingularDoubleField(value: &self.itemPrice)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.itemID != 0 {
      try visitor.visitSingularInt32Field(value: self.itemID, fieldNumber: 1)
    }
    if self.quantity != 0 {
      try visitor.visitSingularInt32Field(value: self.quantity, fieldNumber: 2)
    }
    if !self.itemName.isEmpty {
      try visitor.visitSingularStringField(value: self.itemName, fieldNumber: 3)
    }
    if self.itemPrice != 0 {
      try visitor.visitSingularDoubleField(value: self.itemPrice, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Marketplace_OrderedItem, rhs: Marketplace_OrderedItem) -> Bool {
    if lhs.itemID != rhs.itemID {return false}
    if lhs.quantity != rhs.quantity {return false}
    if lhs.itemName != rhs.itemName {return false}
    if lhs.itemPrice != rhs.itemPrice {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Marketplace_MarketPlaceItem: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MarketPlaceItem"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "itemId"),
    2: .same(proto: "itemName"),
    3: .same(proto: "itemImageLink"),
    4: .same(proto: "itemDescription"),
    5: .same(proto: "itemPrice"),
    6: .same(proto: "itemStock"),
    7: .same(proto: "belongTo"),
    8: .same(proto: "category"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularInt32Field(value: &self.itemID)
      case 2: try decoder.decodeSingularStringField(value: &self.itemName)
      case 3: try decoder.decodeSingularStringField(value: &self.itemImageLink)
      case 4: try decoder.decodeSingularStringField(value: &self.itemDescription)
      case 5: try decoder.decodeSingularDoubleField(value: &self.itemPrice)
      case 6: try decoder.decodeSingularUInt32Field(value: &self.itemStock)
      case 7: try decoder.decodeSingularStringField(value: &self.belongTo)
      case 8: try decoder.decodeSingularStringField(value: &self.category)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.itemID != 0 {
      try visitor.visitSingularInt32Field(value: self.itemID, fieldNumber: 1)
    }
    if !self.itemName.isEmpty {
      try visitor.visitSingularStringField(value: self.itemName, fieldNumber: 2)
    }
    if !self.itemImageLink.isEmpty {
      try visitor.visitSingularStringField(value: self.itemImageLink, fieldNumber: 3)
    }
    if !self.itemDescription.isEmpty {
      try visitor.visitSingularStringField(value: self.itemDescription, fieldNumber: 4)
    }
    if self.itemPrice != 0 {
      try visitor.visitSingularDoubleField(value: self.itemPrice, fieldNumber: 5)
    }
    if self.itemStock != 0 {
      try visitor.visitSingularUInt32Field(value: self.itemStock, fieldNumber: 6)
    }
    if !self.belongTo.isEmpty {
      try visitor.visitSingularStringField(value: self.belongTo, fieldNumber: 7)
    }
    if !self.category.isEmpty {
      try visitor.visitSingularStringField(value: self.category, fieldNumber: 8)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Marketplace_MarketPlaceItem, rhs: Marketplace_MarketPlaceItem) -> Bool {
    if lhs.itemID != rhs.itemID {return false}
    if lhs.itemName != rhs.itemName {return false}
    if lhs.itemImageLink != rhs.itemImageLink {return false}
    if lhs.itemDescription != rhs.itemDescription {return false}
    if lhs.itemPrice != rhs.itemPrice {return false}
    if lhs.itemStock != rhs.itemStock {return false}
    if lhs.belongTo != rhs.belongTo {return false}
    if lhs.category != rhs.category {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
