//
//  TheoremSimilarityTrianglesSideSideSide.swift
//
//
//  Created by GeomerParser.
//

import Foundation

import Core

@available(iOS 10.0, *)
internal class TheoremSimilarityTrianglesSideSideSide: Theorem {

	// MARK: - Initialization
	internal init() {
		super.init(name: "Theorem Similarity Triangles Side Side Side",
				   description: "If the three sides of one triangle are proportional to the three sides of another triangle, then such triangles are similar.",
				   inputTypes: [Triangle.dataType, Triangle.dataType])
	}

	// MARK: - Methods
	internal override func execute() {

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
//			if ((shifted.side(.AB).value / shifted.side(.BC).value).fraction() == (triangle2.side(.AB).value / triangle2.side(.BC).value).fraction()) && (shifted.side(.BC).value / shifted.side(.CA).value).fraction() == (triangle2.side(.BC).value / triangle2.side(.CA).value).fraction())) {
//				result.append(BEPolygonSimilarity(left: triangle1, right: triangle2, leftShift: Shift(i)))
//			}
//			if ((shifted_reversed.side(.AB).value / shifted_reversed.side(.BC).value).fraction() == (triangle2.side(.AB).value / triangle2.side(.BC).value).fraction()) && (shifted_reversed.side(.BC).value / shifted_reversed.side(.CA).value).fraction() == (triangle2.side(.BC).value / triangle2.side(.CA).value).fraction())) {
//				result.append(BEPolygonSimilarity(left: triangle1, right: triangle2, leftShift: Shift(i, reversed = true)))
//			}
		}

	}
}
