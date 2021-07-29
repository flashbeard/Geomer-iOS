//
//  Node.swift
//
//
//  Created by Daniel Pustotin on 04.04.2021.
//

import Foundation

open class AdditionalKind {

}

public protocol AdditionalKindProtocol {

}

/// Basic class for stored objects avaliable for user.
@available(iOS 10.0, *)
public class Node: Data, DataInheritor {

	// MARK: - Properties
	public let name: String
	public let isInput: Bool
	public private (set) var references: Set<Reference>
	private var addidionalKinds: Dictionary<ProtocolWrapper, AdditionalKind> = [:]
	
	// MARK: - Initialization
	public init(name: String, isInput: Bool = false) {
		references = []
		self.isInput = isInput
		self.name = name
	}
	
	// MARK: - Geometry equality
	public func equal(_ to: Node) -> Bool {
		if dataType != to.dataType {
			return false
		}
		let lhs = self
		let rhs = to
		return lhs == rhs || nodeRegistry.contains(BEEquality(left: lhs, right: rhs))
	}
	
	// MARK: - Methods
	public func addReference(reference: Reference) {
		self.references.insert(reference)
	}

	public func addAddidionalKind(for proto: Protocol, _ addidionalKind: AdditionalKind) {
		addidionalKinds[ProtocolWrapper(proto: proto)] = addidionalKind
	}

	public func conforms(to proto: Protocol) -> AdditionalKind? {
		addidionalKinds[ProtocolWrapper(proto: proto)]
	}

	// MARK: - DataInheritor
	public static func < (lhs: Node, rhs: Node) -> Bool {
		lhs.name < rhs.name || lhs.name == rhs.name && String(describing: lhs.dataType) < String(describing: rhs.dataType)
	}

	open override func isEqual(_ object: Any?) -> Bool {
		if let obj = object as? Self {
			return self.dataType == obj.dataType && self.name  == obj.name
		}
		return false
	}

	static func hashValue(for object: Node) -> Int {
		var hasher = Hasher()
		hasher.combine(object.dataTypeString)
		hasher.combine(object.name)
		hasher.combine(object.isInput)
		hasher.combine(object.references)
		return hasher.finalize()
	}


}
