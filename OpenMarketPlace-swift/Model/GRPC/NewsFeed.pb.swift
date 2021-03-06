// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: NewsFeed.proto
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

struct Newsfeed_ItemGrpc {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var itemID: Int32 = 0

  var itemName: String = String()

  var itemImageLink: String = String()

  var itemDescription: String = String()

  var itemPrice: Double = 0

  var itemStock: Int32 = 0

  var belongTo: String = String()

  var category: String = String()

  var purchasedCount: Int32 = 0

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Newsfeed_UserProfile {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var tags: [String] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Newsfeed_TopDealsRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var category: String = String()

  var limit: Int32 = 0

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Newsfeed_TopDealsResult {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var items: [Newsfeed_ItemGrpc] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Newsfeed_RecommendOrganizationRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var tags: [String] = []

  var limit: Int32 = 0

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Newsfeed_RecommendOrganizationResult {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var orgID: [String] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Newsfeed_RecommendItemRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var category: String = String()

  var itemTags: [String] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Newsfeed_RecommendItemResult {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var items: [Newsfeed_ItemGrpc] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Newsfeed_RecommendEventsRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var tags: [String] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Newsfeed_RecommendEventsResult {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var eventID: [String] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Newsfeed_GetPosterRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var limit: Int32 = 0

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Newsfeed_GetPosterResult {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var posterID: [Int32] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "newsfeed"

extension Newsfeed_ItemGrpc: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".ItemGrpc"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "itemId"),
    2: .same(proto: "itemName"),
    3: .same(proto: "itemImageLink"),
    4: .same(proto: "itemDescription"),
    5: .same(proto: "itemPrice"),
    6: .same(proto: "itemStock"),
    7: .same(proto: "belongTo"),
    8: .same(proto: "category"),
    9: .same(proto: "purchasedCount"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularInt32Field(value: &self.itemID)
      case 2: try decoder.decodeSingularStringField(value: &self.itemName)
      case 3: try decoder.decodeSingularStringField(value: &self.itemImageLink)
      case 4: try decoder.decodeSingularStringField(value: &self.itemDescription)
      case 5: try decoder.decodeSingularDoubleField(value: &self.itemPrice)
      case 6: try decoder.decodeSingularInt32Field(value: &self.itemStock)
      case 7: try decoder.decodeSingularStringField(value: &self.belongTo)
      case 8: try decoder.decodeSingularStringField(value: &self.category)
      case 9: try decoder.decodeSingularInt32Field(value: &self.purchasedCount)
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
      try visitor.visitSingularInt32Field(value: self.itemStock, fieldNumber: 6)
    }
    if !self.belongTo.isEmpty {
      try visitor.visitSingularStringField(value: self.belongTo, fieldNumber: 7)
    }
    if !self.category.isEmpty {
      try visitor.visitSingularStringField(value: self.category, fieldNumber: 8)
    }
    if self.purchasedCount != 0 {
      try visitor.visitSingularInt32Field(value: self.purchasedCount, fieldNumber: 9)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Newsfeed_ItemGrpc, rhs: Newsfeed_ItemGrpc) -> Bool {
    if lhs.itemID != rhs.itemID {return false}
    if lhs.itemName != rhs.itemName {return false}
    if lhs.itemImageLink != rhs.itemImageLink {return false}
    if lhs.itemDescription != rhs.itemDescription {return false}
    if lhs.itemPrice != rhs.itemPrice {return false}
    if lhs.itemStock != rhs.itemStock {return false}
    if lhs.belongTo != rhs.belongTo {return false}
    if lhs.category != rhs.category {return false}
    if lhs.purchasedCount != rhs.purchasedCount {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Newsfeed_UserProfile: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".UserProfile"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "tags"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeRepeatedStringField(value: &self.tags)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.tags.isEmpty {
      try visitor.visitRepeatedStringField(value: self.tags, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Newsfeed_UserProfile, rhs: Newsfeed_UserProfile) -> Bool {
    if lhs.tags != rhs.tags {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Newsfeed_TopDealsRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".TopDealsRequest"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "category"),
    2: .same(proto: "limit"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.category)
      case 2: try decoder.decodeSingularInt32Field(value: &self.limit)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.category.isEmpty {
      try visitor.visitSingularStringField(value: self.category, fieldNumber: 1)
    }
    if self.limit != 0 {
      try visitor.visitSingularInt32Field(value: self.limit, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Newsfeed_TopDealsRequest, rhs: Newsfeed_TopDealsRequest) -> Bool {
    if lhs.category != rhs.category {return false}
    if lhs.limit != rhs.limit {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Newsfeed_TopDealsResult: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".TopDealsResult"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "items"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeRepeatedMessageField(value: &self.items)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.items.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.items, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Newsfeed_TopDealsResult, rhs: Newsfeed_TopDealsResult) -> Bool {
    if lhs.items != rhs.items {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Newsfeed_RecommendOrganizationRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".RecommendOrganizationRequest"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "tags"),
    2: .same(proto: "limit"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeRepeatedStringField(value: &self.tags)
      case 2: try decoder.decodeSingularInt32Field(value: &self.limit)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.tags.isEmpty {
      try visitor.visitRepeatedStringField(value: self.tags, fieldNumber: 1)
    }
    if self.limit != 0 {
      try visitor.visitSingularInt32Field(value: self.limit, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Newsfeed_RecommendOrganizationRequest, rhs: Newsfeed_RecommendOrganizationRequest) -> Bool {
    if lhs.tags != rhs.tags {return false}
    if lhs.limit != rhs.limit {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Newsfeed_RecommendOrganizationResult: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".RecommendOrganizationResult"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "orgID"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeRepeatedStringField(value: &self.orgID)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.orgID.isEmpty {
      try visitor.visitRepeatedStringField(value: self.orgID, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Newsfeed_RecommendOrganizationResult, rhs: Newsfeed_RecommendOrganizationResult) -> Bool {
    if lhs.orgID != rhs.orgID {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Newsfeed_RecommendItemRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".RecommendItemRequest"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "category"),
    2: .same(proto: "itemTags"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.category)
      case 2: try decoder.decodeRepeatedStringField(value: &self.itemTags)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.category.isEmpty {
      try visitor.visitSingularStringField(value: self.category, fieldNumber: 1)
    }
    if !self.itemTags.isEmpty {
      try visitor.visitRepeatedStringField(value: self.itemTags, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Newsfeed_RecommendItemRequest, rhs: Newsfeed_RecommendItemRequest) -> Bool {
    if lhs.category != rhs.category {return false}
    if lhs.itemTags != rhs.itemTags {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Newsfeed_RecommendItemResult: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".RecommendItemResult"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "items"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeRepeatedMessageField(value: &self.items)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.items.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.items, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Newsfeed_RecommendItemResult, rhs: Newsfeed_RecommendItemResult) -> Bool {
    if lhs.items != rhs.items {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Newsfeed_RecommendEventsRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".RecommendEventsRequest"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "tags"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeRepeatedStringField(value: &self.tags)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.tags.isEmpty {
      try visitor.visitRepeatedStringField(value: self.tags, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Newsfeed_RecommendEventsRequest, rhs: Newsfeed_RecommendEventsRequest) -> Bool {
    if lhs.tags != rhs.tags {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Newsfeed_RecommendEventsResult: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".RecommendEventsResult"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "eventID"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeRepeatedStringField(value: &self.eventID)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.eventID.isEmpty {
      try visitor.visitRepeatedStringField(value: self.eventID, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Newsfeed_RecommendEventsResult, rhs: Newsfeed_RecommendEventsResult) -> Bool {
    if lhs.eventID != rhs.eventID {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Newsfeed_GetPosterRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".GetPosterRequest"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "limit"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularInt32Field(value: &self.limit)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.limit != 0 {
      try visitor.visitSingularInt32Field(value: self.limit, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Newsfeed_GetPosterRequest, rhs: Newsfeed_GetPosterRequest) -> Bool {
    if lhs.limit != rhs.limit {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Newsfeed_GetPosterResult: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".GetPosterResult"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "posterID"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeRepeatedInt32Field(value: &self.posterID)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.posterID.isEmpty {
      try visitor.visitPackedInt32Field(value: self.posterID, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Newsfeed_GetPosterResult, rhs: Newsfeed_GetPosterResult) -> Bool {
    if lhs.posterID != rhs.posterID {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
