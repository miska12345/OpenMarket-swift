// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: StampEvent.proto
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

enum Event_Error: SwiftProtobuf.Enum {
  typealias RawValue = Int
  case nothing // = 0
  case unauthorized // = 1
  case invalidEventID // = 2
  case alreadyRedeemed // = 3
  case outOfCoins // = 4
  case unknown // = 5
  case UNRECOGNIZED(Int)

  init() {
    self = .nothing
  }

  init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .nothing
    case 1: self = .unauthorized
    case 2: self = .invalidEventID
    case 3: self = .alreadyRedeemed
    case 4: self = .outOfCoins
    case 5: self = .unknown
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  var rawValue: Int {
    switch self {
    case .nothing: return 0
    case .unauthorized: return 1
    case .invalidEventID: return 2
    case .alreadyRedeemed: return 3
    case .outOfCoins: return 4
    case .unknown: return 5
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension Event_Error: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  static var allCases: [Event_Error] = [
    .nothing,
    .unauthorized,
    .invalidEventID,
    .alreadyRedeemed,
    .outOfCoins,
    .unknown,
  ]
}

#endif  // swift(>=4.2)

enum Event_OwnerType: SwiftProtobuf.Enum {
  typealias RawValue = Int
  case user // = 0
  case organization // = 1
  case UNRECOGNIZED(Int)

  init() {
    self = .user
  }

  init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .user
    case 1: self = .organization
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  var rawValue: Int {
    switch self {
    case .user: return 0
    case .organization: return 1
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension Event_OwnerType: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  static var allCases: [Event_OwnerType] = [
    .user,
    .organization,
  ]
}

#endif  // swift(>=4.2)

struct Event_CreateEventRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var currency: String = String()

  var expiresAt: String = String()

  var rewardAmount: Double = 0

  var totalAmount: Double = 0

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Event_CreateEventResult {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var error: Event_Error = .nothing

  var eventID: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Event_DeleteEventRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var eventID: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Event_DeleteEventResult {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var error: Event_Error = .nothing

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Event_RedeemRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var eventID: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Event_RedeemResult {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var error: Event_Error {
    get {return _storage._error}
    set {_uniqueStorage()._error = newValue}
  }

  var message: String {
    get {return _storage._message}
    set {_uniqueStorage()._message = newValue}
  }

  var transactionID: String {
    get {return _storage._transactionID}
    set {_uniqueStorage()._transactionID = newValue}
  }

  var event: Event_Event {
    get {return _storage._event ?? Event_Event()}
    set {_uniqueStorage()._event = newValue}
  }
  /// Returns true if `event` has been explicitly set.
  var hasEvent: Bool {return _storage._event != nil}
  /// Clears the value of `event`. Subsequent reads from it will return its default value.
  mutating func clearEvent() {_uniqueStorage()._event = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

struct Event_GetEventRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var eventID: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Event_GetEventResult {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var error: Event_Error {
    get {return _storage._error}
    set {_uniqueStorage()._error = newValue}
  }

  var event: Event_Event {
    get {return _storage._event ?? Event_Event()}
    set {_uniqueStorage()._event = newValue}
  }
  /// Returns true if `event` has been explicitly set.
  var hasEvent: Bool {return _storage._event != nil}
  /// Clears the value of `event`. Subsequent reads from it will return its default value.
  mutating func clearEvent() {_uniqueStorage()._event = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

struct Event_Event {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var eventID: String = String()

  var owner: String = String()

  var type: Event_OwnerType = .user

  var currency: String = String()

  var expiresAt: String = String()

  var createdAt: String = String()

  var rewardAmount: Double = 0

  var totalAmount: Double = 0

  var remainingAmount: Double = 0

  var successMessage: String = String()

  var errorMessage: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "event"

extension Event_Error: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "NOTHING"),
    1: .same(proto: "UNAUTHORIZED"),
    2: .same(proto: "INVALID_EVENT_ID"),
    3: .same(proto: "ALREADY_REDEEMED"),
    4: .same(proto: "OUT_OF_COINS"),
    5: .same(proto: "UNKNOWN"),
  ]
}

extension Event_OwnerType: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "USER"),
    1: .same(proto: "ORGANIZATION"),
  ]
}

extension Event_CreateEventRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".CreateEventRequest"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "currency"),
    2: .same(proto: "expiresAt"),
    3: .same(proto: "rewardAmount"),
    4: .same(proto: "totalAmount"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.currency)
      case 2: try decoder.decodeSingularStringField(value: &self.expiresAt)
      case 3: try decoder.decodeSingularDoubleField(value: &self.rewardAmount)
      case 4: try decoder.decodeSingularDoubleField(value: &self.totalAmount)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.currency.isEmpty {
      try visitor.visitSingularStringField(value: self.currency, fieldNumber: 1)
    }
    if !self.expiresAt.isEmpty {
      try visitor.visitSingularStringField(value: self.expiresAt, fieldNumber: 2)
    }
    if self.rewardAmount != 0 {
      try visitor.visitSingularDoubleField(value: self.rewardAmount, fieldNumber: 3)
    }
    if self.totalAmount != 0 {
      try visitor.visitSingularDoubleField(value: self.totalAmount, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Event_CreateEventRequest, rhs: Event_CreateEventRequest) -> Bool {
    if lhs.currency != rhs.currency {return false}
    if lhs.expiresAt != rhs.expiresAt {return false}
    if lhs.rewardAmount != rhs.rewardAmount {return false}
    if lhs.totalAmount != rhs.totalAmount {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Event_CreateEventResult: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".CreateEventResult"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "error"),
    2: .same(proto: "eventId"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularEnumField(value: &self.error)
      case 2: try decoder.decodeSingularStringField(value: &self.eventID)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.error != .nothing {
      try visitor.visitSingularEnumField(value: self.error, fieldNumber: 1)
    }
    if !self.eventID.isEmpty {
      try visitor.visitSingularStringField(value: self.eventID, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Event_CreateEventResult, rhs: Event_CreateEventResult) -> Bool {
    if lhs.error != rhs.error {return false}
    if lhs.eventID != rhs.eventID {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Event_DeleteEventRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".DeleteEventRequest"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "eventId"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.eventID)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.eventID.isEmpty {
      try visitor.visitSingularStringField(value: self.eventID, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Event_DeleteEventRequest, rhs: Event_DeleteEventRequest) -> Bool {
    if lhs.eventID != rhs.eventID {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Event_DeleteEventResult: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".DeleteEventResult"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "error"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularEnumField(value: &self.error)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.error != .nothing {
      try visitor.visitSingularEnumField(value: self.error, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Event_DeleteEventResult, rhs: Event_DeleteEventResult) -> Bool {
    if lhs.error != rhs.error {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Event_RedeemRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".RedeemRequest"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "eventId"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.eventID)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.eventID.isEmpty {
      try visitor.visitSingularStringField(value: self.eventID, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Event_RedeemRequest, rhs: Event_RedeemRequest) -> Bool {
    if lhs.eventID != rhs.eventID {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Event_RedeemResult: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".RedeemResult"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "error"),
    2: .same(proto: "message"),
    3: .same(proto: "transactionId"),
    4: .same(proto: "event"),
  ]

  fileprivate class _StorageClass {
    var _error: Event_Error = .nothing
    var _message: String = String()
    var _transactionID: String = String()
    var _event: Event_Event? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _error = source._error
      _message = source._message
      _transactionID = source._transactionID
      _event = source._event
    }
  }

  fileprivate mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _StorageClass(copying: _storage)
    }
    return _storage
  }

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    _ = _uniqueStorage()
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      while let fieldNumber = try decoder.nextFieldNumber() {
        switch fieldNumber {
        case 1: try decoder.decodeSingularEnumField(value: &_storage._error)
        case 2: try decoder.decodeSingularStringField(value: &_storage._message)
        case 3: try decoder.decodeSingularStringField(value: &_storage._transactionID)
        case 4: try decoder.decodeSingularMessageField(value: &_storage._event)
        default: break
        }
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if _storage._error != .nothing {
        try visitor.visitSingularEnumField(value: _storage._error, fieldNumber: 1)
      }
      if !_storage._message.isEmpty {
        try visitor.visitSingularStringField(value: _storage._message, fieldNumber: 2)
      }
      if !_storage._transactionID.isEmpty {
        try visitor.visitSingularStringField(value: _storage._transactionID, fieldNumber: 3)
      }
      if let v = _storage._event {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 4)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Event_RedeemResult, rhs: Event_RedeemResult) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._error != rhs_storage._error {return false}
        if _storage._message != rhs_storage._message {return false}
        if _storage._transactionID != rhs_storage._transactionID {return false}
        if _storage._event != rhs_storage._event {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Event_GetEventRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".GetEventRequest"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "eventId"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.eventID)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.eventID.isEmpty {
      try visitor.visitSingularStringField(value: self.eventID, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Event_GetEventRequest, rhs: Event_GetEventRequest) -> Bool {
    if lhs.eventID != rhs.eventID {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Event_GetEventResult: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".GetEventResult"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "error"),
    2: .same(proto: "event"),
  ]

  fileprivate class _StorageClass {
    var _error: Event_Error = .nothing
    var _event: Event_Event? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _error = source._error
      _event = source._event
    }
  }

  fileprivate mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _StorageClass(copying: _storage)
    }
    return _storage
  }

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    _ = _uniqueStorage()
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      while let fieldNumber = try decoder.nextFieldNumber() {
        switch fieldNumber {
        case 1: try decoder.decodeSingularEnumField(value: &_storage._error)
        case 2: try decoder.decodeSingularMessageField(value: &_storage._event)
        default: break
        }
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if _storage._error != .nothing {
        try visitor.visitSingularEnumField(value: _storage._error, fieldNumber: 1)
      }
      if let v = _storage._event {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Event_GetEventResult, rhs: Event_GetEventResult) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._error != rhs_storage._error {return false}
        if _storage._event != rhs_storage._event {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Event_Event: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Event"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "eventId"),
    2: .same(proto: "owner"),
    3: .same(proto: "type"),
    4: .same(proto: "currency"),
    5: .same(proto: "expiresAt"),
    6: .same(proto: "createdAt"),
    7: .same(proto: "rewardAmount"),
    8: .same(proto: "totalAmount"),
    9: .same(proto: "remainingAmount"),
    10: .same(proto: "successMessage"),
    11: .same(proto: "errorMessage"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.eventID)
      case 2: try decoder.decodeSingularStringField(value: &self.owner)
      case 3: try decoder.decodeSingularEnumField(value: &self.type)
      case 4: try decoder.decodeSingularStringField(value: &self.currency)
      case 5: try decoder.decodeSingularStringField(value: &self.expiresAt)
      case 6: try decoder.decodeSingularStringField(value: &self.createdAt)
      case 7: try decoder.decodeSingularDoubleField(value: &self.rewardAmount)
      case 8: try decoder.decodeSingularDoubleField(value: &self.totalAmount)
      case 9: try decoder.decodeSingularDoubleField(value: &self.remainingAmount)
      case 10: try decoder.decodeSingularStringField(value: &self.successMessage)
      case 11: try decoder.decodeSingularStringField(value: &self.errorMessage)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.eventID.isEmpty {
      try visitor.visitSingularStringField(value: self.eventID, fieldNumber: 1)
    }
    if !self.owner.isEmpty {
      try visitor.visitSingularStringField(value: self.owner, fieldNumber: 2)
    }
    if self.type != .user {
      try visitor.visitSingularEnumField(value: self.type, fieldNumber: 3)
    }
    if !self.currency.isEmpty {
      try visitor.visitSingularStringField(value: self.currency, fieldNumber: 4)
    }
    if !self.expiresAt.isEmpty {
      try visitor.visitSingularStringField(value: self.expiresAt, fieldNumber: 5)
    }
    if !self.createdAt.isEmpty {
      try visitor.visitSingularStringField(value: self.createdAt, fieldNumber: 6)
    }
    if self.rewardAmount != 0 {
      try visitor.visitSingularDoubleField(value: self.rewardAmount, fieldNumber: 7)
    }
    if self.totalAmount != 0 {
      try visitor.visitSingularDoubleField(value: self.totalAmount, fieldNumber: 8)
    }
    if self.remainingAmount != 0 {
      try visitor.visitSingularDoubleField(value: self.remainingAmount, fieldNumber: 9)
    }
    if !self.successMessage.isEmpty {
      try visitor.visitSingularStringField(value: self.successMessage, fieldNumber: 10)
    }
    if !self.errorMessage.isEmpty {
      try visitor.visitSingularStringField(value: self.errorMessage, fieldNumber: 11)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Event_Event, rhs: Event_Event) -> Bool {
    if lhs.eventID != rhs.eventID {return false}
    if lhs.owner != rhs.owner {return false}
    if lhs.type != rhs.type {return false}
    if lhs.currency != rhs.currency {return false}
    if lhs.expiresAt != rhs.expiresAt {return false}
    if lhs.createdAt != rhs.createdAt {return false}
    if lhs.rewardAmount != rhs.rewardAmount {return false}
    if lhs.totalAmount != rhs.totalAmount {return false}
    if lhs.remainingAmount != rhs.remainingAmount {return false}
    if lhs.successMessage != rhs.successMessage {return false}
    if lhs.errorMessage != rhs.errorMessage {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}