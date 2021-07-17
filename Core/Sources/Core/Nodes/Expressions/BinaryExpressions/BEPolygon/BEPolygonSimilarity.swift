//
//  BESimilarity.swift
//  
//
//  Created by Daniel Pustotin on 02.05.2021.
//

import Foundation

@available(iOS 10.0, *)
public class BEPolygonSimilarity: BEPolygon {
	
	// MARK: Properties
	
	public var proportion: Proportion?
	public override class var sign: String { "∾" }
	
	// MARK: Initialization
	
	public init(left: Polygon, right: Polygon, leftShift: Shift, proportion: Proportion? = nil, isInput: Bool = false) {
		self.proportion = proportion
		super.init(left: left, right: right, leftShift: leftShift, isInput: isInput)
	}
	
	public required init(left: Node, right: Node, isInput: Bool = false) {
		fatalError("init(left:right:isInput:) has not been implemented")
	}
}
