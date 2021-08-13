//
//  TheoremEqualityRays.swift
//  
//
//  Created by Daniel Pustotin on 13.08.2021.
//

import Foundation

import Core

@available(iOS 10.0, *)
class TheoremEqualityRays: Theorem {

	// MARK: - Initialization

	init() {
		super.init(name: "Theorem Equality Rays", description: "", inputTypes: [Ray.self, Ray.self])
	}

	// MARK: - Methods

	override func execute() {
		let ray1 = input[0] as! Ray
		let ray2 = input[1] as! Ray

		if ray1 == ray2 {
			return
		}

		if ray1.from.equal(ray2.from) && ray1.through.equal(ray2.through) {
			result.append(BEEquality(left: ray1, right: ray2))
		}
	}
}
