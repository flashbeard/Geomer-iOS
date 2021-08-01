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

	// MARK: Initialization
	internal init() {
		super.init(name: "Theorem Similarity Triangles Angle Angle",
				   description: "If two angles of one triangle are equal to two angles of another triangle, then such triangles are similar.",
				   inputTypes: [Triangle.dataType, Triangle.dataType])
	}

	// MARK: Methods
	internal override func execute() {
		super.execute()
		// MARK: Parameters
		let triangle1 = input[0] as! Triangle
		let triangle2 = input[1] as! Triangle

		// MARK: Preparation


		// MARK: Theorem
		for i in 0...2 {
			let shifted = triangle1.shifted(by: Shift(i))
			let shifted_reversed = triangle1.shifted(by: Shift(i, reversed: true))
			if shifted == triangle2 || shifted_reversed == triangle2 {
				continue
			}
			if ((shifted.angle(.A).equal(triangle2.angle(.A)) && shifted.angle(.B).equal(triangle2.angle(.B))) || (shifted.angle(.B).equal(triangle2.angle(.B)) && shifted.angle(.C).equal(triangle2.angle(.C))) || (shifted.angle(.C).equal(triangle2.angle(.C)) && shifted.angle(.A).equal(triangle2.angle(.A)))) {
				result.append(BEPolygonSimilarity(left: triangle1, right: triangle2, leftShift: Shift(i)))
			}
			if ((shifted_reversed.angle(.A).equal(triangle2.angle(.A)) && shifted_reversed.angle(.B).equal(triangle2.angle(.B))) || (shifted_reversed.angle(.B).equal(triangle2.angle(.B)) && shifted_reversed.angle(.C).equal(triangle2.angle(.C))) || (shifted_reversed.angle(.C).equal(triangle2.angle(.C)) && shifted_reversed.angle(.A).equal(triangle2.angle(.A)))) {
				result.append(BEPolygonSimilarity(left: triangle1, right: triangle2, leftShift: Shift(i, reversed: true)))
			}
		}
	}
}
