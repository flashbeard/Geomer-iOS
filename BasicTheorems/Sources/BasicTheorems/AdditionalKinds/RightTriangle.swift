//
//  RightTriangle.swift
//
//
//  Created by Daniel Pustotin on 19.07.2021.
//

import Foundation

import Core

// TODO: split into proper files

public protocol RightTriangleProtocol {

}

public class RightTriangle: AdditionalKind, RightTriangleProtocol {

}

@available(iOS 10.0, *)
class TheoremFindRightTriangle: Theorem {

	// MARK: - Initialization
	init() {
		super.init(name: "Find right triangle", inputTypes: [Triangle.self])
	}

	// MARK: - Methods
	override func execute() {
		let triangle = input[0] as! Triangle

		if triangle.angle(.A).value == AngularUnit.new(value: 90) ||
			triangle.angle(.B).value == AngularUnit.new(value: 90) ||
			triangle.angle(.C).value == AngularUnit.new(value: 90) {

		}
	}
}
