//
//  Angle.swift
//  
//
//  Created by Daniel Pustotin on 17.05.2021.
//

import Foundation

@available(iOS 10.0, *)
public class Angle: Node, GeometryObject {
	
	// MARK: Properties
	
	public var vertex: Point { r1.a }
	public var r1, r2: Ray
	public var value: AngleValue?
	
	// MARK: Initialization
	
	public init(ray1 r1: Ray, ray2 r2: Ray, angular: AngleValue? = nil, isInput: Bool = false) {
		var paramR1: Node = r1
		var paramR2: Node = r2
		nodeRegistry.findEqual(instance: &paramR1)
		nodeRegistry.findEqual(instance: &paramR2)
		
		if r1.a != r2.a {
			fatalError("Cannot create angle because rays \(r1.info()) and \(r2.info()) are not coming out of the same point")
		}
		
		if paramR1 < paramR2 {
			swap(&paramR1, &paramR2)
		}
		
		self.r1 = paramR1 as! Ray
		self.r2 = paramR2 as! Ray
		self.value = angular
		
		let paramName = "\((paramR1 as! Ray).b.info())\((paramR1 as! Ray).a.info())\((paramR2 as! Ray).b.info())"
		super.init(name: paramName, isInput: isInput)
		
		nodeRegistry.add(instances: r1.a, r1.b, r2.b)
	}
	
	public convenience init(a: Point, b: Point, c: Point, value: AngleValue? = nil, isInput: Bool = false) {
		let r1 = Ray(from: b, through: a, isInput: isInput)
		let r2 = Ray(from: b, through: c, isInput: isInput)
		self.init(ray1: r1, ray2: r2, angular: value, isInput: isInput)
	}
	
	// MARK: Operators
	
	public override func equal(_ to: Node) -> Bool {
		if dataType != to.dataType {
			return false
		}
		let lhs = self
		let rhs = to as! Angle
		return super.equal(rhs) || lhs.r1.equal(rhs.r1) && lhs.r2.equal(rhs.r2) || lhs.value != nil && lhs.value == rhs.value
	}
}
