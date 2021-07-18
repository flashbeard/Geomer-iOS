//
//  Segment.swift
//  
//
//  Created by Daniel Pustotin on 08.04.2021.
//

import Foundation

@available(iOS 10.0, *)
public class Segment: Line {
	
	// MARK: - Properties
	public var value: LinearUnit?
	
	// MARK: - Initialization
	public init(a: Point, b: Point, length: LinearUnit? = nil, isInput: Bool = false) {
		self.value = length
		super.init(a: a, b: b, commutative: true, isInput: isInput)
	}
	
	// MARK: - Operators
	public override func equal(_ to: Node) -> Bool {
		if dataType != to.dataType {
			return false
		}
		let lhs = self
		let rhs = to as! Segment
		return super.equal(rhs) || lhs.value != nil && lhs.value == rhs.value
	}
}
