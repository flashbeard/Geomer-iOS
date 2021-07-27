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
	public override init(name: String, isInput: Bool = false) {
		points = []
		super.init(name: name, isInput: isInput)
	}

	// MARK: - Operators
	public override func equal(_ to: Node) -> Bool {
		if dataType != to.dataType {
			return false
		}
		let lhs = self
		let rhs = to as! Line
		return super.equal(rhs) || lhs.points.first != nil && rhs.points.first != nil && lhs.points.first!.equal(rhs.points.first!) && lhs.points.last != nil && rhs.points.last != nil && lhs.points.last!.equal(rhs.points.last!)
	}

	// MARK: - Methods
	public func insertPoint(_ point: Point, after: Point) {
		var paramPoint: Node = point
		nodeRegistry.find(instance: &paramPoint, put: true)
		var paramAfter: Node = after
		nodeRegistry.find(instance: &paramAfter)
		let index = points.firstIndex(of: paramAfter as! Point)
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
