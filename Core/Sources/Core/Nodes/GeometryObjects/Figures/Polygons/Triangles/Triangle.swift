//
//  Triangle.swift
//  
//
//  Created by Daniel Pustotin on 15.04.2021.
//

import Foundation

public enum TriangleVertexName {
	case A
	case B
	case C
}

public enum TriangleSideName {
	case AB
	case BC
	case CA
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
	public func vertex(_ vertexName: TriangleVertexName) -> Point {
		switch vertexName {
		case .A:
			return vertexes[0]
		case .B:
			return vertexes[1]
		case .C:
			return vertexes[2]
		}
	}

	public func angle(_ angleName: TriangleVertexName) -> Angle {
		switch angleName {
		case .A:
			return angles[0]
		case .B:
			return angles[1]
		case .C:
			return angles[2]
		}
	}

	public func side(_ sideName: TriangleSideName) -> Segment {
		switch sideName {
		case .AB:
			return sides[0]
		case .BC:
			return sides[1]
		case .CA:
			return sides[2]
		}
	}
}
