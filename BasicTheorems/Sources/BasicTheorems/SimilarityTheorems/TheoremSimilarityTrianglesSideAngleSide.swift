//
//  TheoremSimilarityTrianglesSideAngleSide.swift
//
//
//  Created by GeomerParser.
//

import Foundation

import Core

@available(iOS 10.0, *)
internal class TheoremSimilarityTrianglesSideAngleSide: Theorem {

	// MARK: - Initialization
	internal init() {
		super.init(name: "Theorem Similarity Triangles Side Angle Side",
				   description: "If two sides of one triangle are proportional to two sides of another triangle and the angles enclosed between these sides are equal, then such triangles are similar.",
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
				let ratioSidesAB = try? ((triangle1.side(.C).value?.value ?? Double.nan) / (triangle2.side(.C).value?.value ?? Double.nan)).fraction()
				let ratioSidesBC = try? ((triangle1.side(.A).value?.value ?? Double.nan) / (triangle2.side(.A).value?.value ?? Double.nan)).fraction()
				let ratioSidesCA = try? ((triangle1.side(.B).value?.value ?? Double.nan) / (triangle2.side(.B).value?.value ?? Double.nan)).fraction()
				if equalityAnglesA && ratioSidesCA != nil && ratioSidesCA == ratioSidesAB {
					result.append(BEPolygonSimilarity(left: triangle1, right: triangle2, leftShift: Shift(i, reversed: reversed), ratio: ratioSidesAB))
				} else if equalityAnglesB && ratioSidesAB != nil && ratioSidesAB == ratioSidesBC {
					result.append(BEPolygonSimilarity(left: triangle1, right: triangle2, leftShift: Shift(i, reversed: reversed), ratio: ratioSidesBC))
				} else if equalityAnglesC && ratioSidesBC != nil && ratioSidesBC == ratioSidesCA {
					result.append(BEPolygonSimilarity(left: triangle1, right: triangle2, leftShift: Shift(i, reversed: reversed), ratio: ratioSidesCA))
				}
			}
		}
	}
}
