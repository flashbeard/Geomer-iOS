//
//  Data.swift
//  
//
//  Created by Daniel Pustotin on 08.04.2021.
//

import Foundation

/// Basic class for all stored objects
@objc open class Data: NSObject, Comparable {
	
	// MARK: data type
	
	public static var dataType: DataType { Self.self }
	public static var dataTypeString: String { String(describing: dataType) }
	public var dataType: DataType { get { return type(of: self).dataType } }
	public var dataTypeString: String { get { return type(of: self).dataTypeString } }
	
	// MARK: Properties

	public private (set) var name: String
	public let isInput: Bool
	
	// MARK: Initialization
	
	public init(name: String = "", isInput: Bool = false) {
		if name.isEmpty && Self.dataType is DefinedName {
			fatalError("Cannot create \(Data.dataType) class instance with undefined name")
		}
		self.name = name
		self.isInput = isInput
	}
	
	// MARK: Operators
	
	public static func < (lhs: Data, rhs: Data) -> Bool {
		lhs.name < rhs.name || lhs.name == rhs.name && String(describing: lhs.dataType) < String(describing: rhs.dataType)
	}
	
	public static func == (lhs: Data, rhs: Data) -> Bool {
		lhs.dataType == rhs.dataType && lhs.name == rhs.name
	}
	
	// MARK: Hasher function
	override open var hash: Int {
		var hasher: Hasher = Hasher()
		hasher.combine(name)
		hasher.combine(dataTypeString)
		return hasher.finalize()
	}

	open override func isEqual(_ object: Any?) -> Bool {
		self == object as! Data
	}
//	public func hash(into hasher: inout Hasher) {
//		hasher.combine(Data.dataTypeString)
//		hasher.combine(name)
//	}

	// MARK: Methods
	public func test(to: Protocol) {

	}
	
	// MARK: info function
	
	public func info() -> String {
		let str = "\(name == "" ? "Unnamed" : name)"
		return str
	}
}

/// protocol for objects which always should have defined name
public protocol DefinedName {

}
