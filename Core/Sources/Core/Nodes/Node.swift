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
public class Node: Data {

	// MARK: - Properties
	public let name: String
	public var isInput: Bool { references.count == 0 }
	public private (set) var references: Set<Reference>
	private var addidionalKinds: Dictionary<ProtocolWrapper, AdditionalKind> = [:]
	
	// MARK: - Initialization
	public init(name: String) {
		references = []
		self.name = name
	}
	
	// MARK: - Geometry equality
	public func equal(_ to: Node) -> Bool {
		if dataType != to.dataType {
			return false
		}
		let rhs = to
		return self == rhs || nodeRegistry.contains(BEEquality(left: self, right: rhs))
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

	// MARK: - Hashable
	public override func hash(into hasher: inout Hasher) {
		super.hash(into: &hasher)
		hasher.combine(name)
	}
}
