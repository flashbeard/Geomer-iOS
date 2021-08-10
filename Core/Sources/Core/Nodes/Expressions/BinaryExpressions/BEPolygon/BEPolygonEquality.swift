//
//  BEPolygonEquality.swift
//  
//
//  Created by Daniel Pustotin on 29.05.2021.
//

import Foundation

@available(iOS 10.0, *)
public class BEPolygonEquality: BEPolygon {

	// MARK: - Properties
	public override class var sign: String { "=" }

	// MARK: - Initialization
	public override init(left: Polygon, right: Polygon, leftShift: Shift = Shift()) {
		super.init(left: left, right: right, leftShift: leftShift)
	}

	public required init(left: Node, right: Node) {
		if left is Polygon && right is Polygon {
			super.init(left: left as! Polygon, right: right as! Polygon, leftShift: Shift())
		}
		else {
			fatalError("init(left:right:) has not been implemented")
		}
	}
}
