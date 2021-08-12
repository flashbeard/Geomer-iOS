//
//  BEPolygonEquality.swift
//  
//
//  Created by Daniel Pustotin on 29.05.2021.
//

import Foundation

@available(iOS 10.0, *)
public class BEPolygonEquality: BEPolygonCommutative {

	// MARK: - Properties
	public override class var sign: String { "=" }

	// MARK: - Initialization
	public override init(left: Polygon, right: Polygon, leftShift: Shift) {
		super.init(left: left, right: right, leftShift: leftShift)
	}

	public required init(left: Node, right: Node) {
		fatalError("init(left:right:) has not been implemented")
	}
}
