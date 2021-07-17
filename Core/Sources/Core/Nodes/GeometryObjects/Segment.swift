//
//  Segment.swift
//  
//
//  Created by Daniel Pustotin on 08.04.2021.
//

import Foundation

@available(iOS 10.0, *)
public class Segment: Line {
	
	// MARK: Properties
	
	public var length: LengthValue?
	
	// MARK: Initialization
	
	public init(a: Point, b: Point, length: LengthValue? = nil, isInput: Bool = false) {
		self.length = length
		super.init(a: a, b: b, commutative: true, isInput: isInput)
	}
	
	// MARK: Operators
	
	public override func equal(_ to: Node) -> Bool {
		if dataType != to.dataType {
			return false
		}
		let lhs = self
		let rhs = to as! Segment
		return super.equal(rhs) || lhs.length != nil && lhs.length == rhs.length
	}
}
