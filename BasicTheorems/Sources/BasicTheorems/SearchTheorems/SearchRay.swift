//
//  SearchRay.swift
//
//
//  Created by GeomerParser.
//

import Foundation

import Core

@available(iOS 10.0, *)
internal class SearchRay: Theorem {

	// MARK: - Initialization
	internal init() {
		super.init(name: "Search Ray",
				   description: "",
				   inputTypes: [Point.dataType, Point.dataType])
	}

	// MARK: - Methods
	internal override func execute() {

		// MARK: Parameters
		let point1 = input[0] as! Point
		let point2 = input[1] as! Point

		// MARK: Preparation
		if point1.equal(point2) {
			return
		}

		// MARK: Theorem
		result.append(Ray(from: point1, through: point2))
		result.append(Ray(from: point2, through: point1))

	}
}
