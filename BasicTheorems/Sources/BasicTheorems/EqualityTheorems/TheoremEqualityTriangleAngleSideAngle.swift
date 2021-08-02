//
//  TheoremEqualityTriangleAngleSideAngle.swift
//
//
//  Created by GeomerParser.
//

import Foundation

import Core

@available(iOS 10.0, *)
internal class TheoremEqualityTriangleAngleSideAngle: Theorem {

	// MARK: - Initialization
	internal init() {
		super.init(name: "Theorem Equality Triangle Angle Side Angle",
				   description: "If a side and two adjacent angles of one triangle are respectively equal to the side and two adjacent angles of another triangle, then such triangles are equal.",
				   inputTypes: [Triangle.dataType, Triangle.dataType])
	}

	// MARK: - Methods
	internal override func execute() {

		// MARK: Parameters
		let triangle1 = input[0] as! Triangle
		let triangle2 = input[1] as! Triangle

		// MARK: Preparation
		if triangle1.equal(triangle2) {
			return
		}

		// MARK: Theorem
		for i in 0...2 {
			for reversed in [true, false] {
				let shifted = triangle1.shifted(by: Shift(i, reversed: reversed))
				let equalitySidesAB = shifted.side(.AB).equal(triangle2.side(.AB))
				let equalitySidesBC = shifted.side(.BC).equal(triangle2.side(.BC))
				let equalitySidesCA = shifted.side(.CA).equal(triangle2.side(.CA))
				let equalityAnglesA = shifted.angle(.A).equal(triangle2.angle(.A))
				let equalityAnglesB = shifted.angle(.B).equal(triangle2.angle(.B))
				let equalityAnglesC = shifted.angle(.C).equal(triangle2.angle(.C))
				if (equalitySidesAB && equalityAnglesA && equalityAnglesB) || (equalitySidesBC && equalityAnglesB && equalityAnglesC) || (equalitySidesCA && equalityAnglesC && equalityAnglesA) {
					result.append(BEPolygonEquality(left: triangle1, right: triangle2, leftShift: Shift(i, reversed: reversed)))
				}
			}
		}

	}
}
