//
//  ProtocolWrapper.swift
//  
//
//  Created by Daniel Pustotin on 19.07.2021.
//

import Foundation

public struct ProtocolWrapper {
	public let proto: Protocol
}

extension ProtocolWrapper: Equatable {
	public static func ==(lhs: Self, rhs: Self) -> Bool {
		String(describing: lhs.proto) == String(describing: rhs.proto)
	}
}

extension ProtocolWrapper: Hashable {
	public func hash(into hasher: inout Hasher) {
		hasher.combine(ObjectIdentifier(proto))
	}
}

extension Dictionary {
	subscript(_ key: Protocol) -> Value? where Key == ProtocolWrapper {
		get { self[ProtocolWrapper(proto: key)] }
		_modify { yield &self[ProtocolWrapper(proto: key)] }
	}
}
