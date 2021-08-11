//
//  Data.swift
//  
//
//  Created by Daniel Pustotin on 08.04.2021.
//

import Foundation

/// Basic class for all stored objects
open class Data: Comparable, Hashable {

	// MARK: - Properties
	public static var dataType: DataType { Self.self }
	public static var dataTypeString: String { String(describing: dataType) }

	public var dataType: DataType { get { return type(of: self).dataType } }
	public var dataTypeString: String { get { return type(of: self).dataTypeString } }

	// MARK: - Comparable
	public static func < (lhs: Data, rhs: Data) -> Bool {
		lhs.dataTypeString < rhs.dataTypeString || lhs.dataType == rhs.dataType && lhs.hashValue < rhs.hashValue
	}

	// MARK: - Equatable
	public static func == (lhs: Data, rhs: Data) -> Bool {
		lhs.hashValue == rhs.hashValue
	}

	// MARK: - Hashable
	public func hash(into hasher: inout Hasher) {
		hasher.combine(dataTypeString)
	}
}
