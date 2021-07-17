//
//  TriangleEqualityByTwoAnglesAndSide.swift
//  
//
//  Created by Daniel Pustotin on 01.05.2021.
//

import Foundation

import Core

@available(iOS 10.0, *)
internal class TriangleEqualityByTwoAnglesAndSide: Theorem {
	
	// MARK: Initialization
	
	internal init() {
		super.init(name: "Triangle equality by two angles and side", description: "TriangleEqualityByTwoAnglesAndSide", inputTypes: [Triangle.self, Triangle.self])
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
		
//		var e: BEEquality? = nil
		
//		if e1.angleA.equal(e2.angleA) && (e1.sideAB.equal(e2.sideAB)) && e1.angleB.equal(e2.angleB) ||
//			e1.angleB.equal(e2.angleB) && (e1.sideBC.equal(e2.sideBC)) && e1.angleC.equal(e2.angleC) ||
//			e1.angleC.equal(e2.angleC) && (e1.sideCA.equal(e2.sideCA)) && e1.angleA.equal(e2.angleA) {
//			e = BEEquality(left: e1, right: e2)
//		}
//		result = e != nil ? [e!] : []
	}
}
