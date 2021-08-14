//
//  Height.swift
//  
//
//  Created by Daniel Pustotin on 14.08.2021.
//

import Foundation

@available(iOS 10.0, *)
public class Height: Cevian {

	// MARK: - Initialization
	public override init(triangle: Triangle, segment: Segment) {
		super.init(triangle: triangle, segment: segment)
		let side = triangle.side(vertex)
		nodeRegistry.add(instances: BEPerpendicularity(left: segment, right: side))
	}
}
