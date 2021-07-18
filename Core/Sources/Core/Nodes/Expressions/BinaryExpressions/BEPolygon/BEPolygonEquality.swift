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
	public override init(left: Polygon, right: Polygon, leftShift: Shift, isInput: Bool = false) {
		super.init(left: left, right: right, leftShift: leftShift, isInput: isInput)
	}
	
	public required init(left: Node, right: Node, isInput: Bool = false) {
		fatalError("init(left:right:isInput:) has not been implemented")
	}
}
