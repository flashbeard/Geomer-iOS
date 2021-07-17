//
//  File.swift
//  
//
//  Created by Daniel Pustotin on 16.07.2021.
//

import Foundation

import Core

@available(iOS 10.0, *)
internal class TestTheorem: Theorem {

	// MARK: Initialization

	internal init() {
		super.init(name: "Test", description: "Just test", inputTypes: [Point.self, Point.self])
	}

	// MARK: Methods

	internal override func execute() {
		super.execute()
		let e1 = input[0] as! Point
		let e2 = input[1] as! Point

		if e1.name == "A" && e2.name == "C" {
			result = [Point(name: "B")]
		}

		if e1.name == "B" && e2.name == "C" {
			result = [Point(name: "D")]
		}
	}
}
