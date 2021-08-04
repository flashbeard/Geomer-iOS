//
//  Line.swift
//  
//
//  Created by Daniel Pustotin on 08.04.2021.
//

import Foundation

@available(iOS 10.0, *)
public class Line: Node, GeometryObject {
	
	// MARK: - Properties
	public var points: [Point]
	
	// MARK: - Initialization
	public override init(name: String) {
		points = []
		super.init(name: name)
	}

	// MARK: - Operators
	public override func equal(_ to: Node) -> Bool {
		if dataType != to.dataType {
			return false
		}
		let rhs = to as! Line
		if super.equal(rhs) {
			return true
		}

		for i in 0 ..< points.count {
			for j in i + 1 ..< points.count {
				if rhs.points.contains(where: { $0.equal(points[i]) }) && rhs.points.contains(where: { $0.equal(points[j]) }) {
					return true
				}
			}
		}
		return false
	}

	// MARK: - Methods
	public func insertPoint(_ point: Point, after: Point? = nil) {
		var paramPoint: Node = point
		nodeRegistry.find(instance: &paramPoint, put: true)
		var index: Int? = nil
		if after != nil {
			var paramAfter: Node = after!
			nodeRegistry.find(instance: &paramAfter)
			index = points.firstIndex(of: paramAfter as! Point)
		}
		points.insert(point, at: (index ?? -1) + 1)
	}

	/// Defines whether `pointA` is closer to the beginig of the line than `pointB` or not
	/// - Parameters:
	///   - pointA: first point to compare
	///   - pointB: another point to compare
	/// - Returns: **-1** if `pointA` is closer, **0** if `pointA` is equal to `pointB`, **1** if `pointA` is further and **nil** if `pointA` or `pointB` do not lay on this line.
	public func compare(pointA: Point, pointB: Point) -> Int? {
		if !points.contains(pointA) || !points.contains(pointB) {
			return nil
		}
		if pointA == pointB {
			return 0
		}
		let indexA = points.firstIndex(of: pointA)!
		let indexB = points.firstIndex(of: pointB)!
		return indexA < indexB ? -1 : 1
	}
}
