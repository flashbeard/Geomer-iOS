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
	public init(a: Point, b: Point, length: LinearUnit? = nil) {
		var paramA: Node = a
		var paramB: Node = b
		nodeRegistry.findEqual(instance: &paramA)
		nodeRegistry.findEqual(instance: &paramB)
		pointA = paramA as! Point
		pointB = paramB as! Point
		value = length
		super.init(name: "\(pointA.name)\(pointB.name)")
		insertPoint(pointA)
		insertPoint(pointB, after: pointA)
	}
}
