//
//  Reference.swift
//  
//
//  Created by Daniel Pustotin on 17.04.2021.
//

import Foundation

/// Defines the way how object was produced
@available(iOS 10.0, *)
public class Reference: Data, DataInheritor {

	// MARK: - Properties
	
	public private (set) var fromNodes: [Node]
	public private (set) var byTheorem: Theorem
	
	// MARK: - Initialization
	
	public init(from fromNodes: [Node], by byTheorem: Theorem) {
		self.fromNodes = fromNodes
		self.byTheorem = byTheorem
		super.init()
	}
	
	// MARK: - Data inheritor
	static func < (lhs: Reference, rhs: Reference) -> Bool {
		lhs.hash < rhs.hash
	}

	static func == (lhs: Reference, rhs: Reference) -> Bool {
		lhs.fromNodes == rhs.fromNodes && lhs.byTheorem == rhs.byTheorem
	}

	static func hashValue(for object: Reference) -> Int {
		var hasher = Hasher()
		hasher.combine(object.dataTypeString)
		hasher.combine(object.fromNodes)
		hasher.combine(object.byTheorem)
		return hasher.finalize()
	}

}
