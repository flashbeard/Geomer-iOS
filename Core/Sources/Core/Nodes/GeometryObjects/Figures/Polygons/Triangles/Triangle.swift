//
//  Triangle.swift
//  
//
//  Created by Daniel Pustotin on 15.04.2021.
//

import Foundation

public enum TriangleVertex {
	case A
	case B
	case C
}

@available(iOS 10.0, *)
public class Triangle: Polygon {

	// MARK: - Initialization
	public required init(vertexes: [Point]) {

		var paramVertexes: [Point] = vertexes

		paramVertexes.sort(by: { $0.name < $1.name })

		super.init(vertexes: paramVertexes)
	}

	// MARK: - Methods
	public func vertex(_ vertex: TriangleVertex) -> Point {
		switch vertex {
		case .A:
			return vertexes[0]
		case .B:
			return vertexes[1]
		case .C:
			return vertexes[2]
		}
	}

	public func angle(_ vertex: TriangleVertex) -> Angle {
		switch vertex {
		case .A:
			return angles[0]
		case .B:
			return angles[1]
		case .C:
			return angles[2]
		}
	}

	public func side(_ vertex: TriangleVertex) -> Segment {
		switch vertex {
		case .C:
			return sides[0]
		case .A:
			return sides[1]
		case .B:
			return sides[2]
		}
	}
}
