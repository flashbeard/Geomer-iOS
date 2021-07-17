//
//  BEPolygon.swift
//  
//
//  Created by Daniel Pustotin on 29.05.2021.
//

import Foundation

@available(iOS 10.0, *)
public class BEPolygon: BinaryExpression {
	
	// MARK: Properties
	
	public private (set) var leftShift: Shift
	
	// MARK: Initialization
	
	public init(left: Polygon, right: Polygon, leftShift: Shift, isInput: Bool = false) {
		self.leftShift = leftShift
		super.init(left: left, right: right, isInput: isInput)
	}
	
	public required init(left: Node, right: Node, isInput: Bool = false) {
		fatalError("init(left:right:isInput:) has not been implemented")
	}
}
