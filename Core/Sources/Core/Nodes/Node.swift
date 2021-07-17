//
//  Node.swift
//
//
//  Created by Daniel Pustotin on 04.04.2021.
//

import Foundation

/// Basic class for real stored objects
@available(iOS 10.0, *)
public class Node: Data, DefinedName {
	
	// MARK: Properties
	
	public private (set) var references: Set<Reference>
	
	// MARK: Initialization
	
	public override init(name: String, isInput: Bool = false) {
		references = []
		super.init(name: name, isInput: isInput)
	}
	
	// MARK: Operators
	
	public func equal(_ to: Node) -> Bool {
		if dataType != to.dataType {
			return false
		}
		let lhs = self
		let rhs = to
		return lhs == rhs || nodeRegistry.have(instance: BEEquality(left: lhs, right: rhs))
	}
	
	// MARK: Methods
	
	public func addReference(reference: Reference) {
		self.references.insert(reference)
	}
}
