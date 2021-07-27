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
	public var pointA: Point
	public var pointB: Point
	
	// MARK: - Initialization
	public init(a: Point, b: Point, length: LinearUnit? = nil, isInput: Bool = false) {
		pointA = a
		pointB = b
		value = length
		super.init(name: "\(a.name)\(b.name)", isInput: isInput)
		insertPoint(a, after: a)
		insertPoint(b, after: a)
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
