//
//  Ray.swift
//  
//
//  Created by Daniel Pustotin on 08.04.2021.
//

import Foundation

@available(iOS 10.0, *)
public class Ray: Line {

	// MARK: - Properties
	public var from: Point
	public var through: Point
	
	// MARK: - Initialization
	public init(from: Point, through: Point) {
		self.from = from
		self.through = through
		super.init(name: "\(from.name)\(through.name)")
	}

	public override func equal(_ to: Node) -> Bool {
		if dataType != to.dataType {
			return false
		}
		let rhs = to as! Ray
		if super.equal(rhs) {
			return true
		}

		if !from.equal(rhs.from) {
			return false
		}

		for p in points {
			if !p.equal(from) && rhs.points.contains(where: { $0.equal(through) }) {
				return true
			}
		}
		return false
	}
}
