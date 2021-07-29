//
//  Data.swift
//  
//
//  Created by Daniel Pustotin on 08.04.2021.
//

import Foundation

protocol ComparableData {
	static func <(lhs: Self, rhs: Self) -> Bool
}

protocol HashableData {
	static func hashValue(for object: Self) -> Int
}

protocol DataInheritor: ComparableData, HashableData {

}

/// Basic class for all stored objects
@objc open class Data: NSObject, Comparable {

	// MARK: - Properties
	public static var dataType: DataType { Self.self }
	public static var dataTypeString: String { String(describing: dataType) }

	public var dataType: DataType { get { return type(of: self).dataType } }
	public var dataTypeString: String { get { return type(of: self).dataTypeString } }
	
	// MARK: - Initialization
	
	// MARK: - ComparableData
	public static func < (lhs: Data, rhs: Data) -> Bool {
		lhs.dataTypeString < rhs.dataTypeString
	}
	
	public static func == (lhs: Data, rhs: Data) -> Bool {
		lhs.isEqual(rhs)
	}

	// MARK: - HashableData
	static func hashValue(for object: Data) -> Int {
		var hasher: Hasher = Hasher()
		hasher.combine(object.dataTypeString)
		return hasher.finalize()
	}
	
	// MARK: - Overriding NSObject hash for Data
	override open var hash: Int {
		Self.hashValue(for: self)
	}

	open override func isEqual(_ object: Any?) -> Bool {
		if let obj = object as? Self {
			return self.dataType == obj.dataType
		}
		return false
	}
}
