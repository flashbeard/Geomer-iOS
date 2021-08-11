//
//  Angle.swift
//  
//
//  Created by Daniel Pustotin on 17.05.2021.
//

import Foundation

@available(iOS 10.0, *)
public class Angle: Node, GeometryObject {
	
	// MARK: - Properties
	public var vertex: Point { r1.from }
	public var r1, r2: Ray
	public var value: AngularUnit?
	
	// MARK: - Initialization
	public init(ray1 r1: Ray, ray2 r2: Ray, angular: AngularUnit? = nil) {
		var paramR1: Node = r1
		var paramR2: Node = r2
		nodeRegistry.findEqual(instance: &paramR1)
		nodeRegistry.findEqual(instance: &paramR2)
		
		if r1.from != r2.from {
			fatalError("Cannot create angle because rays \(r1.name) and \(r2.name) are not coming out of the same point")
		}
		
		if paramR1 < paramR2 {
			swap(&paramR1, &paramR2)
		}
		
		self.r1 = paramR1 as! Ray
		self.r2 = paramR2 as! Ray
		self.value = angular
		
		let paramName = "\((paramR1 as! Ray).through.name)\((paramR1 as! Ray).from.name)\((paramR2 as! Ray).through.name)"
		super.init(name: paramName)
		
		nodeRegistry.add(instances: r1.from, r1.through, r2.through)
	}
	
	public convenience init(a: Point, b: Point, c: Point, value: AngularUnit? = nil) {
		let r1 = Ray(from: b, through: a)
		let r2 = Ray(from: b, through: c)
		self.init(ray1: r1, ray2: r2, angular: value)
	}
}
