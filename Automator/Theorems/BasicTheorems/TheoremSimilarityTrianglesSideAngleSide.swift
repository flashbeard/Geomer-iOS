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

	// MARK: Initialization
	internal init() {
		super.init(name: "Theorem Similarity Triangles Side Angle Side",
				   description: "If two sides of one triangle are proportional to two sides of another triangle and the angles enclosed between these sides are equal, then such triangles are similar.",
				   inputTypes: [Triangle.dataType(), Triangle.dataType()])
	}

	// MARK: Methods
	internal override func execute() {
		super.execute()
        // MARK: Parameters
		let triangle1 = input[0] as! Triangle
		let triangle2 = input[1] as! Triangle

        // MARK: Preparation
		if triangle1.equal(triangle2) {
			return
		}
		let shifted_reversed2 = triangle1.shifted(by: Shift(2, reversed: true))
		let shifted_reversed1 = triangle1.shifted(by: Shift(1, reversed: true))
		let shifted_reversed0 = triangle1.shifted(by: Shift(reversed: true))
		let shifted0 = triangle1.shifted(by: Shift())
		let shifted1 = triangle1.shifted(by: Shift(1))
		let shifted2 = triangle1.shifted(by: Shift(2))

        // MARK: Theorem
		if (shifted_reversed2.angle(.A).value == triangle2.angle(.A).value && triangle2.angle(.A).value != nil && shifted_reversed2.side(.AB).value != nil && shifted_reversed2.side(.AC).value != nil && triangle2.side(.AB).value != nil && triangle2.side(.AC).value != nil && shifted_reversed2.side(.AC).value != 0 && triangle2.side(.AC).value != 0 && (shifted_reversed2.side(.AB).value / shifted_reversed2.side(.AC).value).fraction() == (triangle2.side(.AB).value / triangle2.side(.AC).value).fraction()) {
            // MARK: Creating result
		    var res: Node

            // MARK: Defining result
		    res = BEPolygonSimilarity(left: triangle1, right: triangle2, leftShift: Shift(2, reversed: true))

            // MARK: Saving result
		    result.append(res)
	    }
        if (shifted_reversed1.angle(.A).value == triangle2.angle(.A).value && triangle2.angle(.A).value != nil && shifted_reversed1.side(.AB).value != nil && shifted_reversed1.side(.AC).value != nil && triangle2.side(.AB).value != nil && triangle2.side(.AC).value != nil && shifted_reversed1.side(.AC).value != 0 && triangle2.side(.AC).value != 0 && (shifted_reversed1.side(.AB).value / shifted_reversed1.side(.AC).value).fraction() == (triangle2.side(.AB).value / triangle2.side(.AC).value).fraction()) {
            // MARK: Creating result
		    var res: Node

            // MARK: Defining result
		    res = BEPolygonSimilarity(left: triangle1, right: triangle2, leftShift: Shift(1, reversed: true))

            // MARK: Saving result
		    result.append(res)
	    }
        if (shifted_reversed0.angle(.A).value == triangle2.angle(.A).value && triangle2.angle(.A).value != nil && shifted_reversed0.side(.AB).value != nil && shifted_reversed0.side(.AC).value != nil && triangle2.side(.AB).value != nil && triangle2.side(.AC).value != nil && shifted_reversed0.side(.AC).value != 0 && triangle2.side(.AC).value != 0 && (shifted_reversed0.side(.AB).value / shifted_reversed0.side(.AC).value).fraction() == (triangle2.side(.AB).value / triangle2.side(.AC).value).fraction()) {
            // MARK: Creating result
		    var res: Node

            // MARK: Defining result
		    res = BEPolygonSimilarity(left: triangle1, right: triangle2, leftShift: Shift(0, reversed: true))

            // MARK: Saving result
		    result.append(res)
	    }
        if (shifted0.angle(.A).value == triangle2.angle(.A).value && triangle2.angle(.A).value != nil && shifted0.side(.AB).value != nil && shifted0.side(.AC).value != nil && triangle2.side(.AB).value != nil && triangle2.side(.AC).value != nil && shifted0.side(.AC).value != 0 && triangle2.side(.AC).value != 0 && (shifted0.side(.AB).value / shifted0.side(.AC).value).fraction() == (triangle2.side(.AB).value / triangle2.side(.AC).value).fraction()) {
            // MARK: Creating result
		    var res: Node

            // MARK: Defining result
		    res = BEPolygonSimilarity(left: triangle1, right: triangle2, leftShift: Shift())

            // MARK: Saving result
		    result.append(res)
	    }
        if (shifted1.angle(.A).value == triangle2.angle(.A).value && triangle2.angle(.A).value != nil && shifted1.side(.AB).value != nil && shifted1.side(.AC).value != nil && triangle2.side(.AB).value != nil && triangle2.side(.AC).value != nil && shifted1.side(.AC).value != 0 && triangle2.side(.AC).value != 0 && (shifted1.side(.AB).value / shifted1.side(.AC).value).fraction() == (triangle2.side(.AB).value / triangle2.side(.AC).value).fraction()) {
            // MARK: Creating result
		    var res: Node

            // MARK: Defining result
		    res = BEPolygonSimilarity(left: triangle1, right: triangle2, leftShift: Shift(1))

            // MARK: Saving result
		    result.append(res)
	    }
        if (shifted2.angle(.A).value == triangle2.angle(.A).value && triangle2.angle(.A).value != nil && shifted2.side(.AB).value != nil && shifted2.side(.AC).value != nil && triangle2.side(.AB).value != nil && triangle2.side(.AC).value != nil && shifted2.side(.AC).value != 0 && triangle2.side(.AC).value != 0 && (shifted2.side(.AB).value / shifted2.side(.AC).value).fraction() == (triangle2.side(.AB).value / triangle2.side(.AC).value).fraction()) {
            // MARK: Creating result
		    var res: Node

            // MARK: Defining result
		    res = BEPolygonSimilarity(left: triangle1, right: triangle2, leftShift: Shift(2))

            // MARK: Saving result
		    result.append(res)
	    }
	}
}