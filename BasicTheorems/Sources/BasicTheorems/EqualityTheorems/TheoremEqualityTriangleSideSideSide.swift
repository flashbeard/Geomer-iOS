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
		if triangle1.equal(triangle2) {
			return
		}
		for i in 0...2 {
			let shifted = triangle1.shifted(by: Shift(i))
			let shifted_reversed = triangle1.shifted(by: Shift(i, reversed: true))
			if (shifted.side(.AB).equal(triangle2.side(.AB)) && shifted.side(.BC).equal(triangle2.side(.BC)) && shifted.side(.CA).equal(triangle2.side(.CA))) {
				result.append(BEPolygonEquality(left: triangle1, right: triangle2, leftShift: Shift(i)))
			}
			if (shifted_reversed.side(.AB).equal(triangle2.side(.AB)) && shifted_reversed.side(.BC).equal(triangle2.side(.BC)) && shifted_reversed.side(.CA).equal(triangle2.side(.CA))) {
				result.append(BEPolygonEquality(left: triangle1, right: triangle2, leftShift: Shift(i, reversed: true)))
			}
		}
	}
}
