//
//  File.swift
//  
//
//  Created by Daniel Pustotin on 20.05.2021.
//

import Foundation

import Core

@available(iOS 10.0, *)
internal class TheoremCosineTriangle: Theorem {
	
	// MARK: Initialization
	
	internal init() {
		super.init(name: "Theorem cosine triangle",
				   description: "The triangle side's length can be calculated as: c * c = a * a + b * b - 2 * a * b * cos(phi)",
				   inputTypes: [Triangle.self])
	}
	
	// MARK: Methods
	
	internal override func execute() {
		super.execute()
//		let triangle = input[0] as! Triangle
		
//		if (triangle.sideAB.length != nil && triangle.sideBC.length != nil && triangle.angleB.value != nil) {
//			let a = triangle.sideAB.length!.value
//			let b = triangle.sideBC.length!.value
//			let len = LengthValue.new(value: sqrt(a * a + b * b - 2 * a * b * cos(triangle.angleB.value!.converted(to: .radians).value)))
//
//			var res: Node = triangle.sideCA
//			nodeRegistry.find(instance: &res)
//			(res as! Segment).length = len
//			result.append(res)
//		}
//
//		if (triangle.sideBC.length != nil && triangle.sideCA.length != nil && triangle.angleC.value != nil) {
//			let a = triangle.sideBC.length!.value
//			let b = triangle.sideCA.length!.value
//			let len = LengthValue.new(value: sqrt(a * a + b * b - 2 * a * b * cos(triangle.angleC.value!.converted(to: .radians).value)))
//
//			var res: Node = triangle.sideAB
//			nodeRegistry.find(instance: &res)
//			(res as! Segment).length = len
//			result.append(res)
//		}
//
//		if (triangle.sideCA.length != nil && triangle.sideAB.length != nil && triangle.angleA.value != nil) {
//			let a = triangle.sideCA.length!.value
//			let b = triangle.sideAB.length!.value
//			let len = LengthValue.new(value: sqrt(a * a + b * b - 2 * a * b * cos(triangle.angleA.value!.converted(to: .radians).value)))
//
//			var res: Node = triangle.sideBC
//			nodeRegistry.find(instance: &res)
//			(res as! Segment).length = len
//			result.append(res)
//		}
	}
}
