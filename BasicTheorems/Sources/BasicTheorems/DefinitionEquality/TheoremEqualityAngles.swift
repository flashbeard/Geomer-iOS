//
//  TheoremEqualityAngles.swift
//  
//
//  Created by Daniel Pustotin on 13.08.2021.
//

import Foundation

import Core

@available(iOS 10.0, *)
class TheoremEqualityAngles: Theorem {

	// MARK: - Initialization

	init() {
		super.init(name: "Theorem Equality Segments", description: "", inputTypes: [Angle.self, Angle.self])
	}

	// MARK: - Methods

	override func execute() {
		let angle1 = input[0] as! Angle
		let angle2 = input[1] as! Angle

		if angle1 == angle2 {
			return
		}

		if angle1.r1.equal(angle2.r1) && angle1.r2.equal(angle2.r2) || angle1.r1.equal(angle2.r2) && angle1.r2.equal(angle2.r1) || angle1.value != nil && angle1.value == angle2.value {
			result.append(BEEquality(left: angle1, right: angle2))
		}
	}
}
