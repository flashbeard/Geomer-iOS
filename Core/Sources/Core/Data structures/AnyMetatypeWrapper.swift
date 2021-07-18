//
//  AnyMetatypeWrapper.swift
//  
//
//  Created by Daniel Pustotin on 18.07.2021.
//

import Foundation

public typealias DataType = Core.Data.Type

public struct AnyMetatypeWrapper {
	public let metatype: DataType
}

extension AnyMetatypeWrapper: Equatable {
	public static func ==(lhs: Self, rhs: Self) -> Bool {
		lhs.metatype == rhs.metatype
	}
}

extension AnyMetatypeWrapper: Hashable {
	public func hash(into hasher: inout Hasher) {
		hasher.combine(ObjectIdentifier(metatype))
	}
}

extension Dictionary {
	subscript(_ key: DataType) -> Value? where Key == AnyMetatypeWrapper {
		get { self[AnyMetatypeWrapper(metatype: key)] }
		_modify { yield &self[AnyMetatypeWrapper(metatype: key)] }
	}
}
