//
//  Reference.swift
//  
//
//  Created by Daniel Pustotin on 17.04.2021.
//

import Foundation

/// Defines the way how object was produced
@available(iOS 10.0, *)
public class Reference: Data {
	
	// MARK: Properties
	
	public private (set) var fromNodes: [Node]
	public private (set) var byTheorem: Theorem
	
	// MARK: Initialization
	
	public init(from fromNodes: [Node], by byTheorem: Theorem) {
		self.fromNodes = fromNodes
		self.byTheorem = byTheorem
		super.init()
	}
	
	// MARK: Operators
	
	public static func == (lhs: Reference, rhs: Reference) -> Bool {
		lhs as Data == rhs as Data && lhs.fromNodes == rhs.fromNodes && lhs.byTheorem == rhs.byTheorem
	}
	
	// MARK: hasher function
	
//	public override func hash(into hasher: inout Hasher) {
//		super.hash(into: &hasher)
//		hasher.combine(fromNodes)
//		hasher.combine(byTheorem)
//	}
}
