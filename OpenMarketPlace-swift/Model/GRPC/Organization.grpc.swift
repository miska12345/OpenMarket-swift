//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: Organization.proto
//

//
// Copyright 2018, gRPC Authors All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
import Dispatch
import Foundation
import SwiftGRPC
import SwiftProtobuf

internal protocol OrganizationaddOrganizationCall: ClientCallUnary {}

fileprivate final class OrganizationaddOrganizationCallBase: ClientCallUnaryBase<OrgMetadata, AddOrgResult>, OrganizationaddOrganizationCall {
  override class var method: String { return "/Organization/addOrganization" }
}

internal protocol OrganizationgetOrganizationCall: ClientCallUnary {}

fileprivate final class OrganizationgetOrganizationCallBase: ClientCallUnaryBase<GetOrgRequest, GetOrgResult>, OrganizationgetOrganizationCall {
  override class var method: String { return "/Organization/getOrganization" }
}

internal protocol OrganizationupdateOrganizationCall: ClientCallUnary {}

fileprivate final class OrganizationupdateOrganizationCallBase: ClientCallUnaryBase<OrgMetadata, OrgUpdateResult>, OrganizationupdateOrganizationCall {
  override class var method: String { return "/Organization/updateOrganization" }
}

internal protocol OrganizationupdateFollowerCall: ClientCallUnary {}

fileprivate final class OrganizationupdateFollowerCallBase: ClientCallUnaryBase<UpdateFollowerRequest, UpdateFollowerResult>, OrganizationupdateFollowerCall {
  override class var method: String { return "/Organization/updateFollower" }
}

internal protocol OrganizationgetFollowersCall: ClientCallUnary {}

fileprivate final class OrganizationgetFollowersCallBase: ClientCallUnaryBase<GetFollowerRequest, GetFollowerResult>, OrganizationgetFollowersCall {
  override class var method: String { return "/Organization/getFollowers" }
}

internal protocol OrganizationisUserFollowingCall: ClientCallUnary {}

fileprivate final class OrganizationisUserFollowingCallBase: ClientCallUnaryBase<IsUserFollowingRequest, IsUserFollowingResult>, OrganizationisUserFollowingCall {
  override class var method: String { return "/Organization/isUserFollowing" }
}


/// Instantiate OrganizationServiceClient, then call methods of this protocol to make API calls.
internal protocol OrganizationService: ServiceClient {
  /// Synchronous. Unary.
  func addOrganization(_ request: OrgMetadata, metadata customMetadata: Metadata) throws -> AddOrgResult
  /// Asynchronous. Unary.
  @discardableResult
  func addOrganization(_ request: OrgMetadata, metadata customMetadata: Metadata, completion: @escaping (AddOrgResult?, CallResult) -> Void) throws -> OrganizationaddOrganizationCall

  /// Synchronous. Unary.
  func getOrganization(_ request: GetOrgRequest, metadata customMetadata: Metadata) throws -> GetOrgResult
  /// Asynchronous. Unary.
  @discardableResult
  func getOrganization(_ request: GetOrgRequest, metadata customMetadata: Metadata, completion: @escaping (GetOrgResult?, CallResult) -> Void) throws -> OrganizationgetOrganizationCall

  /// Synchronous. Unary.
  func updateOrganization(_ request: OrgMetadata, metadata customMetadata: Metadata) throws -> OrgUpdateResult
  /// Asynchronous. Unary.
  @discardableResult
  func updateOrganization(_ request: OrgMetadata, metadata customMetadata: Metadata, completion: @escaping (OrgUpdateResult?, CallResult) -> Void) throws -> OrganizationupdateOrganizationCall

  /// Synchronous. Unary.
  func updateFollower(_ request: UpdateFollowerRequest, metadata customMetadata: Metadata) throws -> UpdateFollowerResult
  /// Asynchronous. Unary.
  @discardableResult
  func updateFollower(_ request: UpdateFollowerRequest, metadata customMetadata: Metadata, completion: @escaping (UpdateFollowerResult?, CallResult) -> Void) throws -> OrganizationupdateFollowerCall

  /// Synchronous. Unary.
  func getFollowers(_ request: GetFollowerRequest, metadata customMetadata: Metadata) throws -> GetFollowerResult
  /// Asynchronous. Unary.
  @discardableResult
  func getFollowers(_ request: GetFollowerRequest, metadata customMetadata: Metadata, completion: @escaping (GetFollowerResult?, CallResult) -> Void) throws -> OrganizationgetFollowersCall

  /// Synchronous. Unary.
  func isUserFollowing(_ request: IsUserFollowingRequest, metadata customMetadata: Metadata) throws -> IsUserFollowingResult
  /// Asynchronous. Unary.
  @discardableResult
  func isUserFollowing(_ request: IsUserFollowingRequest, metadata customMetadata: Metadata, completion: @escaping (IsUserFollowingResult?, CallResult) -> Void) throws -> OrganizationisUserFollowingCall

}

internal extension OrganizationService {
  /// Synchronous. Unary.
  func addOrganization(_ request: OrgMetadata) throws -> AddOrgResult {
    return try self.addOrganization(request, metadata: self.metadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  func addOrganization(_ request: OrgMetadata, completion: @escaping (AddOrgResult?, CallResult) -> Void) throws -> OrganizationaddOrganizationCall {
    return try self.addOrganization(request, metadata: self.metadata, completion: completion)
  }

  /// Synchronous. Unary.
  func getOrganization(_ request: GetOrgRequest) throws -> GetOrgResult {
    return try self.getOrganization(request, metadata: self.metadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  func getOrganization(_ request: GetOrgRequest, completion: @escaping (GetOrgResult?, CallResult) -> Void) throws -> OrganizationgetOrganizationCall {
    return try self.getOrganization(request, metadata: self.metadata, completion: completion)
  }

  /// Synchronous. Unary.
  func updateOrganization(_ request: OrgMetadata) throws -> OrgUpdateResult {
    return try self.updateOrganization(request, metadata: self.metadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  func updateOrganization(_ request: OrgMetadata, completion: @escaping (OrgUpdateResult?, CallResult) -> Void) throws -> OrganizationupdateOrganizationCall {
    return try self.updateOrganization(request, metadata: self.metadata, completion: completion)
  }

  /// Synchronous. Unary.
  func updateFollower(_ request: UpdateFollowerRequest) throws -> UpdateFollowerResult {
    return try self.updateFollower(request, metadata: self.metadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  func updateFollower(_ request: UpdateFollowerRequest, completion: @escaping (UpdateFollowerResult?, CallResult) -> Void) throws -> OrganizationupdateFollowerCall {
    return try self.updateFollower(request, metadata: self.metadata, completion: completion)
  }

  /// Synchronous. Unary.
  func getFollowers(_ request: GetFollowerRequest) throws -> GetFollowerResult {
    return try self.getFollowers(request, metadata: self.metadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  func getFollowers(_ request: GetFollowerRequest, completion: @escaping (GetFollowerResult?, CallResult) -> Void) throws -> OrganizationgetFollowersCall {
    return try self.getFollowers(request, metadata: self.metadata, completion: completion)
  }

  /// Synchronous. Unary.
  func isUserFollowing(_ request: IsUserFollowingRequest) throws -> IsUserFollowingResult {
    return try self.isUserFollowing(request, metadata: self.metadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  func isUserFollowing(_ request: IsUserFollowingRequest, completion: @escaping (IsUserFollowingResult?, CallResult) -> Void) throws -> OrganizationisUserFollowingCall {
    return try self.isUserFollowing(request, metadata: self.metadata, completion: completion)
  }

}

internal final class OrganizationServiceClient: ServiceClientBase, OrganizationService {
  /// Synchronous. Unary.
  internal func addOrganization(_ request: OrgMetadata, metadata customMetadata: Metadata) throws -> AddOrgResult {
    return try OrganizationaddOrganizationCallBase(channel)
      .run(request: request, metadata: customMetadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  internal func addOrganization(_ request: OrgMetadata, metadata customMetadata: Metadata, completion: @escaping (AddOrgResult?, CallResult) -> Void) throws -> OrganizationaddOrganizationCall {
    return try OrganizationaddOrganizationCallBase(channel)
      .start(request: request, metadata: customMetadata, completion: completion)
  }

  /// Synchronous. Unary.
  internal func getOrganization(_ request: GetOrgRequest, metadata customMetadata: Metadata) throws -> GetOrgResult {
    return try OrganizationgetOrganizationCallBase(channel)
      .run(request: request, metadata: customMetadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  internal func getOrganization(_ request: GetOrgRequest, metadata customMetadata: Metadata, completion: @escaping (GetOrgResult?, CallResult) -> Void) throws -> OrganizationgetOrganizationCall {
    return try OrganizationgetOrganizationCallBase(channel)
      .start(request: request, metadata: customMetadata, completion: completion)
  }

  /// Synchronous. Unary.
  internal func updateOrganization(_ request: OrgMetadata, metadata customMetadata: Metadata) throws -> OrgUpdateResult {
    return try OrganizationupdateOrganizationCallBase(channel)
      .run(request: request, metadata: customMetadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  internal func updateOrganization(_ request: OrgMetadata, metadata customMetadata: Metadata, completion: @escaping (OrgUpdateResult?, CallResult) -> Void) throws -> OrganizationupdateOrganizationCall {
    return try OrganizationupdateOrganizationCallBase(channel)
      .start(request: request, metadata: customMetadata, completion: completion)
  }

  /// Synchronous. Unary.
  internal func updateFollower(_ request: UpdateFollowerRequest, metadata customMetadata: Metadata) throws -> UpdateFollowerResult {
    return try OrganizationupdateFollowerCallBase(channel)
      .run(request: request, metadata: customMetadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  internal func updateFollower(_ request: UpdateFollowerRequest, metadata customMetadata: Metadata, completion: @escaping (UpdateFollowerResult?, CallResult) -> Void) throws -> OrganizationupdateFollowerCall {
    return try OrganizationupdateFollowerCallBase(channel)
      .start(request: request, metadata: customMetadata, completion: completion)
  }

  /// Synchronous. Unary.
  internal func getFollowers(_ request: GetFollowerRequest, metadata customMetadata: Metadata) throws -> GetFollowerResult {
    return try OrganizationgetFollowersCallBase(channel)
      .run(request: request, metadata: customMetadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  internal func getFollowers(_ request: GetFollowerRequest, metadata customMetadata: Metadata, completion: @escaping (GetFollowerResult?, CallResult) -> Void) throws -> OrganizationgetFollowersCall {
    return try OrganizationgetFollowersCallBase(channel)
      .start(request: request, metadata: customMetadata, completion: completion)
  }

  /// Synchronous. Unary.
  internal func isUserFollowing(_ request: IsUserFollowingRequest, metadata customMetadata: Metadata) throws -> IsUserFollowingResult {
    return try OrganizationisUserFollowingCallBase(channel)
      .run(request: request, metadata: customMetadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  internal func isUserFollowing(_ request: IsUserFollowingRequest, metadata customMetadata: Metadata, completion: @escaping (IsUserFollowingResult?, CallResult) -> Void) throws -> OrganizationisUserFollowingCall {
    return try OrganizationisUserFollowingCallBase(channel)
      .start(request: request, metadata: customMetadata, completion: completion)
  }

}

