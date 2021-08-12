//
//  File.swift
//  
//
//  Created by Daniel Pustotin on 12.08.2021.
//

import Foundation

import Core

@available(iOS 10.0, *)
class TheoremEqualitySegments: Theorem {

	// MARK: - Initialization

	init() {
		super.init(name: "Test", description: "Just test", inputTypes: [Segment.self, Segment.self])
	}

	// MARK: - Methods

	override func execute() {
		let segment1 = input[0] as! Segment
		let segment2 = input[1] as! Segment

		if segment1 == segment2 {
			return
		}

		if segment1.pointA.equal(segment2.pointA) && segment1.pointB.equal(segment2.pointB) || segment1.pointA.equal(segment2.pointB) && segment1.pointB.equal(segment2.pointA) || segment1.value != nil && segment1.value == segment2.value {
			result.append(BEEquality(left: segment1, right: segment2))
		}
	}
}
