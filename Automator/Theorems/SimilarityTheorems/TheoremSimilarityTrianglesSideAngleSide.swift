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
    		

            // MARK: Theorem
    		for i in 0...2 {
			let shifted = triangle1.shifted(by: Shift(i))
			let shifted_reversed = triangle1.shifted(by: Shift(i, reversed: true))
			if shifted == triangle2 || shifted_reversed == triangle2 {
				continue
			}
			if ((shifted.angle(.A).equal(triangle2.angle(.A)) && (shifted.side(.AB).value / shifted.side(.AC).value).fraction() == (triangle2.side(.AB).value / triangle2.side(.AC).value).fraction()) || (shifted.angle(.B).equal(triangle2.angle(.B)) && (shifted.side(.AB).value / shifted.side(.BC).value).fraction() == (triangle2.side(.AB).value / triangle2.side(.BC).value).fraction()) || (shifted.angle(.C).equal(triangle2.angle(.C)) && (shifted.side(.BC).value / shifted.side(.CA).value).fraction() == (triangle2.side(.BC).value / triangle2.side(.CA).value).fraction())) {
				res = BEPolygonSimilarity(left: triangle1, right: triangle2, leftShift: Shift(i))
			}
			if ((shifted_reversed.angle(.A).equal(triangle2.angle(.A)) && (shifted_reversed.side(.AB).value / shifted_reversed.side(.AC).value).fraction() == (triangle2.side(.AB).value / triangle2.side(.AC).value).fraction()) || (shifted_reversed.angle(.B).equal(triangle2.angle(.B)) && (shifted_reversed.side(.AB).value / shifted_reversed.side(.BC).value).fraction() == (triangle2.side(.AB).value / triangle2.side(.BC).value).fraction()) || (shifted_reversed.angle(.C).equal(triangle2.angle(.C)) && (shifted_reversed.side(.BC).value / shifted_reversed.side(.CA).value).fraction() == (triangle2.side(.BC).value / triangle2.side(.CA).value).fraction())) {
				res = BEPolygonSimilarity(left: triangle1, right: triangle2, leftShift: Shift(i, reversed = true))
			}
		}
    	}
    }