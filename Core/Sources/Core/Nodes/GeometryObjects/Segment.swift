//
//  Segment.swift
//  
//
//  Created by Daniel Pustotin on 08.04.2021.
//

import Foundation

public protocol NumericValue {
	var value is MeasurementValue? { get set }
}

@available(iOS 10.0, *)
public class Segment: Line, NumericValue {
	
	// MARK: Properties
	
	public var value: LengthValue?
	
	// MARK: Initialization
	
	public init(a: Point, b: Point, length: LengthValue? = nil, isInput: Bool = false) {
		self.value = length
		super.init(a: a, b: b, commutative: true, isInput: isInput)
	}
	
	// MARK: Operators
	
	public override func equal(_ to: Node) -> Bool {
		if dataType != to.dataType {
			return false
		}
		let lhs = self
		let rhs = to as! Segment
		return super.equal(rhs) || lhs.value != nil && lhs.value == rhs.value
	}
}
