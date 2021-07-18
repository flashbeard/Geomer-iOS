//
//  Polygon.swift
//  
//
//  Created by Daniel Pustotin on 15.04.2021.
//

import Foundation

@available(iOS 10.0, *)
public class Polygon: Node, Figure {

	// MARK: - Properties
	public var sides: [Segment]
	public var vertexes: [Point]
	public var angles: [Angle]
	public let count: Int
	public var area: Area?
	public var perimeter: Perimeter?

	// MARK: - Initialization
	public required init(vertexes: [Point], isInput: Bool = false) {
		let count = vertexes.count
		if count <= 2 {
			fatalError("\(Self.dataType) cannot have \(count) \(count == 1 ? "vertex" : "vertexes")")
		}

		self.count = count

		var paramVertexes: [Node] = vertexes
		for i in 0 ..< count {
			nodeRegistry.findEqual(instance: &paramVertexes[i])
		}

		var paramAngles: [Node] = []
		for i in 0 ..< count {
			paramAngles.append(Angle(a: vertexes[(i + count - 1) % count], b: vertexes[i], c: vertexes[(i + 1) % count]))
			nodeRegistry.findEqual(instance: &paramAngles[i])
		}
		angles = paramAngles as! [Angle]

		self.vertexes = paramVertexes as! [Point]

		var paramSides: [Node] = []
		for i in 0 ..< count {
			paramSides.append(Segment(a: paramVertexes[i] as! Point, b: paramVertexes[(i + 1) % count] as! Point))
			nodeRegistry.findEqual(instance: &paramSides[i])
		}
		sides = paramSides as! [Segment]

		var paramName = ""
		for vertex in paramVertexes {
			paramName += "\(vertex.name)"
		}
		super.init(name: paramName, isInput: isInput)

		nodeRegistry.add(instances: vertexes)
	}

	// MARK: - Methods
	public func shifted(by shift: Shift) -> Self {
		Self(vertexes: vertexes.shifted(by: shift))
	}
}
