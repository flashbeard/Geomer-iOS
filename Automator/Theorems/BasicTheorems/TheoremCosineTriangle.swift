//
//  TheoremCosineTriangle.swift
//
//
//  Created by GeomerParser.
//

import Foundation

import Core

@available(iOS 10.0, *)
internal class TheoremCosineTriangle: Theorem {

	// MARK: Initialization
	internal init() {
		super.init(name: "Theorem cosine triangle",
				   description: "The triangle side's length can be calculated as: c * c = a * a + b * b - 2 * a * b * cos(phi)",
				   inputTypes: [Triangle.dataType()])
	}

	// MARK: Methods
	internal override func execute() {
		super.execute()
        // MARK: Parameters
		let triangle = input[0] as! Triangle

        // MARK: Preparation
		

        // MARK: Theorem
		if (triangle.side(.AB).length != nil && triangle.side(.BC).length != nil && triangle.angle(.B).value != nil) {
            // MARK: Creating result
		    var res: Node

            // MARK: Defining result
		    let a = triangle.side(.AB).length!.value
			let b = triangle.side(.BC).length!.value
			let len = Length.new(value: sqrt(a * a + b * b - 2 * a * b * cos(triangle.angleB.value!.converted(to: .radians).value)))
			res = triangle.side(.CA)
			nodeRegistry.find(instance: &res)
			(res as! Segment).length = len

            // MARK: Saving result
		    result.append(res)
	    }
	}
}