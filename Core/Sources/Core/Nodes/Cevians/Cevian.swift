//
//  Cevian.swift
//  
//
//  Created by Daniel Pustotin on 14.08.2021.
//

import Foundation

@available(iOS 10.0, *)
public class Cevian: Node {

	// MARK: - Properties
	public var triangle: Triangle
	public var vertex: TriangleVertex
	public var segment: Segment

	// MARK: - Initialization
	public init(triangle: Triangle, segment: Segment) {
		var paramTriangle: Node = triangle
		var paramSegment: Node = segment
		nodeRegistry.find(instance: &paramTriangle, put: true)
		nodeRegistry.find(instance: &paramSegment, put: true)

		switch segment.pointA {
		case (paramTriangle as! Triangle).vertex(.A):
			vertex = .A
		case (paramTriangle as! Triangle).vertex(.B):
			vertex = .B
		default:
			vertex = .C
		}
		self.triangle = triangle
		self.segment = segment
		triangle.side(vertex).insertPoint(segment.pointB, after: triangle.side(vertex).pointA)
		super.init(name: "Cevian \(paramSegment.name) [\(paramTriangle.name)]")
	}
}
