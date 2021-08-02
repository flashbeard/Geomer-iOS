//
//  BESimilarity.swift
//  
//
//  Created by Daniel Pustotin on 02.05.2021.
//

import Foundation

import Math

@available(iOS 10.0, *)
public class BEPolygonSimilarity: BEPolygon {
	
	// MARK: - Properties
	public var ratio: Fraction?
	public override class var sign: String { "∾" }
	
	// MARK: - Initialization
	public init(left: Polygon, right: Polygon, leftShift: Shift, ratio: Fraction? = nil) {
		self.ratio = ratio
		super.init(left: left, right: right, leftShift: leftShift)
	}

	public required init(left: Node, right: Node) {
		fatalError("init(left:right:) has not been implemented")
	}
	
}
