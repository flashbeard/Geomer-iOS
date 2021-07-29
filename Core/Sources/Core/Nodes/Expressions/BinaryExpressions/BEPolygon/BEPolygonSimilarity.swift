//
//  BESimilarity.swift
//  
//
//  Created by Daniel Pustotin on 02.05.2021.
//

import Foundation

@available(iOS 10.0, *)
public class BEPolygonSimilarity: BEPolygon {
	
	// MARK: - Properties
	public var proportion: Proportion?
	public override class var sign: String { "∾" }
	
	// MARK: - Initialization
	public init(left: Polygon, right: Polygon, leftShift: Shift, proportion: Proportion? = nil) {
		self.proportion = proportion
		super.init(left: left, right: right, leftShift: leftShift)
	}

	public required init(left: Node, right: Node) {
		fatalError("init(left:right:) has not been implemented")
	}
	
}
