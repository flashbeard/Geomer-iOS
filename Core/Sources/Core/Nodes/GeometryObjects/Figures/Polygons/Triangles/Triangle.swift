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

	// MARK: Properties

	private var definedAngles: Bool {
		return angle(.A).value != nil && angle(.B).value != nil && angle(.C).value != nil
	}

	private var definedSides: Bool {
		return side(.AB).length != nil && side(.BC).length != nil && side(.CA).length != nil
	}

	public var isAcute: Bool {
		return definedAngles &&
			angle(.A).value!.value < 90 &&
			angle(.B).value!.value < 90 &&
			angle(.C).value!.value < 90
	}

	public var isRight: Bool {
		return 	definedAngles && (
			angle(.A).value!.value == 90 ||
			angle(.B).value!.value == 90 ||
			angle(.C).value!.value == 90)
	}

	public var isObtuse: Bool {
		return definedAngles && (
			angle(.A).value!.value > 90 ||
			angle(.B).value!.value > 90 ||
			angle(.C).value!.value > 90)
	}

	public var isIsosceles: Bool {
		return definedSides && (
			side(.AB).length == side(.BC).length ||
			side(.BC).length == side(.CA).length ||
			side(.CA).length == side(.AB).length)
	}

	public var isEquilateral: Bool {
		return definedSides &&
			side(.AB).length == side(.BC).length &&
			side(.BC).length == side(.CA).length
	}

	// MARK: Initialization

	public required init(vertexes: [Point], isInput: Bool = false) {

		var paramVertexes: [Point] = vertexes

		paramVertexes.sort(by: { $0.name < $1.name })

		super.init(vertexes: paramVertexes, isInput: isInput)
	}

	// MARK: Methods

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

	public func side(_ angleName: TriangleSideName) -> Segment {
		switch angleName {
		case .AB:
			return sides[0]
		case .BC:
			return sides[1]
		case .CA:
			return sides[2]
		}
	}

}
