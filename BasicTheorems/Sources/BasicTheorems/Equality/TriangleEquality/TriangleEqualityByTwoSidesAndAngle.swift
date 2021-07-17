//
//  TriangleEqualityByTwoSidesAndAngle.swift
//  
//
//  Created by Daniel Pustotin on 01.05.2021.
//

import Foundation

import Core

@available(iOS 10.0, *)
internal class TriangleEqualityByTwoSidesAndAngle: Theorem {
	
	// MARK: Initialization
	
	internal init() {
		super.init(name: "Triangle equality by two sides and angle", description: "TriangleEqualityByTwoSidesAndAngle", inputTypes: [Triangle.self, Triangle.self])
	}
	
	// MARK: Methods
	
	internal override func execute() {
		super.execute()
		let e1 = input[0] as! Triangle
		let e2 = input[1] as! Triangle
		
		if e1 == e2 {
			result = []
			return
		}
		
		var e: BEEquality? = nil
		
		if 	e1.angle(.A).equal(e2.angle(.A)) && (e1.side(.AB).equal(e2.side(.AB))) && (e1.side(.CA).equal(e2.side(.CA))) ||
				e1.angle(.B).equal(e2.angle(.B)) && (e1.side(.BC).equal(e2.side(.BC))) && (e1.side(.AB).equal(e2.side(.AB))) ||
				e1.angle(.C).equal(e2.angle(.C)) && (e1.side(.CA).equal(e2.side(.CA))) && (e1.side(.BC).equal(e2.side(.BC))) {
			e = BEEquality(left: e1, right: e2)
		}
		result = e != nil ? [e!] : []
	}
}
