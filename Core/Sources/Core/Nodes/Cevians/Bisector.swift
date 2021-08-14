//
//  Bisector.swift
//  
//
//  Created by Daniel Pustotin on 14.08.2021.
//

import Foundation

@available(iOS 10.0, *)
public class Bisector: Cevian {

	// MARK: - Initialization
	public override init(triangle: Triangle, segment: Segment) {
		super.init(triangle: triangle, segment: segment)
		let side = triangle.side(vertex)
		nodeRegistry.add(instances: BEEquality(left: Angle(a: side.pointA, b: segment.pointA, c: segment.pointB), right: Angle(a: side.pointB, b: segment.pointA, c: segment.pointB)))
	}
}
