//
//  TheoremSimilarityTrianglesAngleAngle.swift
//
//
//  Created by GeomerParser.
//

import Foundation

import Core

@available(iOS 10.0, *)
internal class TheoremSimilarityTrianglesAngleAngle: Theorem {

	// MARK: - Initialization
	internal init() {
		super.init(name: "Theorem Similarity Triangles Angle Angle",
				   description: "If two angles of one triangle are equal to two angles of another triangle, then such triangles are similar.",
				   inputTypes: [Triangle.dataType, Triangle.dataType])
	}

	// MARK: - Methods
	internal override func execute() {

		// MARK: Parameters
		let triangle1 = input[0] as! Triangle
		let triangle2 = input[1] as! Triangle

		// MARK: Preparation
		if triangle1 == triangle2 {
			return
		}

		// MARK: Theorem
		for i in 0...2 {
			triangle1.shift(by: Shift(1))
			for reversed in [true, false] {
				triangle1.shift(by: Shift(reversed: true))
				let equalityAnglesA = triangle1.angle(.A).equal(triangle2.angle(.A))
				let equalityAnglesB = triangle1.angle(.B).equal(triangle2.angle(.B))
				let equalityAnglesC = triangle1.angle(.C).equal(triangle2.angle(.C))
				if ((equalityAnglesA && equalityAnglesB) || (equalityAnglesB && equalityAnglesC) || (equalityAnglesC && equalityAnglesA)) {
					result.append(BEPolygonSimilarity(left: triangle1, right: triangle2, leftShift: Shift(i, reversed: reversed)))
				}
			}
		}
	}
}
