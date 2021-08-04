//
//  Intersection.swift
//  
//
//  Created by Daniel Pustotin on 08.07.2021.
//

import Foundation

@available(iOS 10.0, *)
public class BELineIntersection: BECommutative {

	// MARK: - Properties
	public private (set) var intersectionPoint: Point?
	public override class var sign: String { "∩" }

	// MARK: - Initialization
	public init(left: Line, right: Line, intersectionPoint: Point? = nil) {
		self.intersectionPoint = intersectionPoint
		super.init(left: left, right: right)
	}

	public required init(left: Node, right: Node) {
		fatalError("init(left:right:) has not been implemented")
	}
	

}
