//
//  SearchTriangle.swift
//
//
//  Created by GeomerParser.
//

import Foundation

import Core

@available(iOS 10.0, *)
internal class SearchTriangle: Theorem {
	
	// MARK: Initialization
	internal init() {
		super.init(name: "Search Triangle",
				   description: "",
				   inputTypes: [Point.dataType, Point.dataType, Point.dataType])
	}
	
	// MARK: Methods
	internal override func execute() {
		super.execute()
		// MARK: Parameters
		let point1 = input[0] as! Point
		let point2 = input[1] as! Point
		let point3 = input[2] as! Point
		
		// MARK: Preparation
		
		
		// MARK: Theorem
		if point1 == point2 || point2 == point3 || point3 == point1 {
			result = []
			return
		}
		
		if (true) {
			var res: Node
			res = Triangle(vertexes: [point1, point2, point3])
			result.append(res)
		}
	}
}
