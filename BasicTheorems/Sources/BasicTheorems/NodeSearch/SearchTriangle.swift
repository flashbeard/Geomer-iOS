//
//  SearchTriangle.swift
//  
//
//  Created by Daniel Pustotin on 21.05.2021.
//

import Foundation

import Core

@available(iOS 10.0, *)
internal class SearchTriangle: Theorem {
	
	// MARK: Initialization
	
	internal init() {
		super.init(name: "Search triangle", description: "", inputTypes: [Point.self, Point.self, Point.self])
	}
	
	// MARK: Methods
	
	internal override func execute() {
		super.execute()
		let point1 = input[0] as! Point
		let point2 = input[1] as! Point
		let point3 = input[2] as! Point
		
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
