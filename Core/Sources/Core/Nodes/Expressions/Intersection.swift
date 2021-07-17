//
//  Intersection.swift
//  
//
//  Created by Daniel Pustotin on 08.07.2021.
//

import Foundation

@available(iOS 10.0, *)
public class BELineIntersection: BinaryExpression {

	// MARK: Properties

	public private (set) var intersectionPoint: Point?
	public override class var sign: String { "∩" }

	// MARK: Initialization

	public init(left: Line, right: Line, intersectionPoint: Point? = nil, isInput: Bool = false) {
		self.intersectionPoint = intersectionPoint
		super.init(left: left, right: right, isInput: isInput)
	}

	public required init(left: Node, right: Node, isInput: Bool = false) {
		fatalError("init(left:right:isInput:) has not been implemented")
	}

}
