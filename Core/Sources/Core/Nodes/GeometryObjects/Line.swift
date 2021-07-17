//
//  Line.swift
//  
//
//  Created by Daniel Pustotin on 08.04.2021.
//

import Foundation

@available(iOS 10.0, *)
public class Line: Node, GeometryObject {
	
	// MARK: Properties
	
	public var a, b: Point
	
	// MARK: Initialization
	
	public init(a: Point, b: Point, commutative: Bool = true, isInput: Bool = false) {
		var paramA: Node = a
		var paramB: Node = b
		nodeRegistry.getInstance(equal_to: &paramA)
		nodeRegistry.getInstance(equal_to: &paramB)
		if commutative && paramA > paramB {
			swap(&paramA, &paramB)
		}
		self.a = paramA as! Point
		self.b = paramB as! Point
		
		let paramName = "\(paramA.info())\(paramB.info())"
		super.init(name: paramName, isInput: isInput)
	}
	
	// MARK: Operators
	
	public override func equal(_ to: Node) -> Bool {
		if dataType != to.dataType {
			return false
		}
		let lhs = self
		let rhs = to as! Line
		return super.equal(rhs) || lhs.a.equal(rhs.a) && lhs.b.equal(rhs.b)
	}
}
