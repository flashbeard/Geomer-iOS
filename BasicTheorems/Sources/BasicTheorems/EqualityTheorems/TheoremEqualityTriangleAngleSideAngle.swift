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
	
	// MARK: Initialization
	internal init() {
		super.init(name: "Theorem Equality Triangle Angle Side Angle",
				   description: "If a side and two adjacent angles of one triangle are respectively equal to the side and two adjacent angles of another triangle, then such triangles are equal.",
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
			if ((shifted.side(.AB).equal(triangle2.side(.AB)) && shifted.angle(.A).equal(triangle2.angle(.A)) && shifted.angle(.B).equal(triangle2.angle(.B))) || (shifted.side(.BC).equal(triangle2.side(.BC)) && shifted.angle(.B).equal(triangle2.angle(.B)) && shifted.angle(.C).equal(triangle2.angle(.C))) || (shifted.side(.CA).equal(triangle2.side(.CA)) && shifted.angle(.C).equal(triangle2.angle(.C)) && shifted.angle(.A).equal(triangle2.angle(.A)))) {
				result.append(BEPolygonEquality(left: triangle1, right: triangle2, leftShift: Shift(i)))
			}
			if ((shifted_reversed.side(.AB).equal(triangle2.side(.AB)) && shifted_reversed.angle(.A).equal(triangle2.angle(.A)) && shifted_reversed.angle(.B).equal(triangle2.angle(.B))) || (shifted_reversed.side(.BC).equal(triangle2.side(.BC)) && shifted_reversed.angle(.B).equal(triangle2.angle(.B)) && shifted_reversed.angle(.C).equal(triangle2.angle(.C))) || (shifted_reversed.side(.CA).equal(triangle2.side(.CA)) && shifted_reversed.angle(.C).equal(triangle2.angle(.C)) && shifted_reversed.angle(.A).equal(triangle2.angle(.A)))) {
				result.append(BEPolygonEquality(left: triangle1, right: triangle2, leftShift: Shift(i, reversed: true)))
			}
		}
	}
}
