//
//  BEPolygonCommutative.swift
//  
//
//  Created by Daniel Pustotin on 12.08.2021.
//

import Foundation

@available(iOS 10.0, *)
public class BEPolygonCommutative: BEPolygon {

	// MARK: - Initialization
	public override init(left: Polygon, right: Polygon, leftShift: Shift = Shift()) {
		var paramLeft = left
		var paramRight = right
		if paramLeft > paramRight {
			swap(&paramLeft, &paramRight)
		}
		super.init(left: paramLeft, right: paramRight, leftShift: leftShift)
	}

	public required init(left: Node, right: Node) {
		fatalError("init(left:right:) has not been implemented")
	}
}
