//
//  TriangleSimilarityByThreeAngles.swift
//  
//
//  Created by Daniel Pustotin on 02.05.2021.
//

import Foundation

import Core

@available(iOS 10.0, *)
internal class TriangleSimilarityByTwoAngles: Theorem {
	
	// MARK: Initialization
	internal init() {
		super.init(name: "Theorem similarity triangle angle angle",
				   description: "",
				   inputTypes: [Triangle.self, Triangle.self])
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

		// MARK: Theorem
	}
}
