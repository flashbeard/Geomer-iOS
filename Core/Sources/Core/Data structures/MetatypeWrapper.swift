//
//  AnyMetatypeWrapper.swift
//  
//
//  Created by Daniel Pustotin on 18.07.2021.
//

import Foundation

public typealias DataType = Core.Data.Type

public struct MetatypeWrapper {
	public let metatype: DataType
}

extension MetatypeWrapper: Equatable {
	public static func ==(lhs: Self, rhs: Self) -> Bool {
		lhs.metatype == rhs.metatype
	}
}

extension MetatypeWrapper: Hashable {
	public func hash(into hasher: inout Hasher) {
		hasher.combine(ObjectIdentifier(metatype))
	}
}

extension Dictionary {
	subscript(_ key: DataType) -> Value? where Key == MetatypeWrapper {
		get {
			self[MetatypeWrapper(metatype: key)]
		}
		_modify {
			yield &self[MetatypeWrapper(metatype: key)]
		}
	}
}


