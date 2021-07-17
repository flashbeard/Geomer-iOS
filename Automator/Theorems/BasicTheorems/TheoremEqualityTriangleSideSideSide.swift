//
//  TheoremEqualityTriangleSideSideSide.swift
//
//
//  Created by GeomerParser.
//

import Foundation

import Core

@available(iOS 10.0, *)
internal class TheoremEqualityTriangleSideSideSide: Theorem {

	// MARK: Initialization
	internal init() {
		super.init(name: "Theorem equality triangle side side side",
				   description: "If three sides of one triangle are equal to three corresponding sides of the other triangle then these triangles are equal to each other",
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
		if (shifted_reversed2.side(.AB).equal(triangle2.side(.AB)) && shifted_reversed2.side(.BC).equal(triangle2.side(.BC)) && shifted_reversed2.side(.CA).equal(triangle2.side(.CA))) {
            // MARK: Creating result
		    var res: Node

            // MARK: Defining result
		    res = BEPolygonEquality(left: triangle1, right: triangle2, leftShift: Shift(2, reversed: true))

            // MARK: Saving result
		    result.append(res)
	    }
        if (shifted_reversed1.side(.AB).equal(triangle2.side(.AB)) && shifted_reversed1.side(.BC).equal(triangle2.side(.BC)) && shifted_reversed1.side(.CA).equal(triangle2.side(.CA))) {
            // MARK: Creating result
		    var res: Node

            // MARK: Defining result
		    res = BEPolygonEquality(left: triangle1, right: triangle2, leftShift: Shift(1, reversed: true))

            // MARK: Saving result
		    result.append(res)
	    }
        if (shifted_reversed0.side(.AB).equal(triangle2.side(.AB)) && shifted_reversed0.side(.BC).equal(triangle2.side(.BC)) && shifted_reversed0.side(.CA).equal(triangle2.side(.CA))) {
            // MARK: Creating result
		    var res: Node

            // MARK: Defining result
		    res = BEPolygonEquality(left: triangle1, right: triangle2, leftShift: Shift(reversed: true))

            // MARK: Saving result
		    result.append(res)
	    }
        if (shifted0.side(.AB).equal(triangle2.side(.AB)) && shifted0.side(.BC).equal(triangle2.side(.BC)) && shifted0.side(.CA).equal(triangle2.side(.CA))) {
            // MARK: Creating result
		    var res: Node

            // MARK: Defining result
		    res = BEPolygonEquality(left: triangle1, right: triangle2, leftShift: Shift())

            // MARK: Saving result
		    result.append(res)
	    }
        if (shifted1.side(.AB).equal(triangle2.side(.AB)) && shifted1.side(.BC).equal(triangle2.side(.BC)) && shifted1.side(.CA).equal(triangle2.side(.CA))) {
            // MARK: Creating result
		    var res: Node

            // MARK: Defining result
		    res = BEPolygonEquality(left: triangle1, right: triangle2, leftShift: Shift(1))

            // MARK: Saving result
		    result.append(res)
	    }
        if (shifted2.side(.AB).equal(triangle2.side(.AB)) && shifted2.side(.BC).equal(triangle2.side(.BC)) && shifted2.side(.CA).equal(triangle2.side(.CA))) {
            // MARK: Creating result
		    var res: Node

            // MARK: Defining result
		    res = BEPolygonEquality(left: triangle1, right: triangle2, leftShift: Shift(2))

            // MARK: Saving result
		    result.append(res)
	    }
	}
}