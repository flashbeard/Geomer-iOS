//
//  SearchLine.swift
//  
//
//  Created by Daniel Pustotin on 21.05.2021.
//

import Foundation

import Core

@available(iOS 10.0, *)
internal class SearchLine: Theorem {
	
	// MARK: Initialization
	
	internal init() {
		super.init(name: "Search line", description: "", inputTypes: [Point.self, Point.self])
	}
	
	// MARK: Methods
	
	internal override func execute() {
		super.execute()
		let point1 = input[0] as! Point
		let point2 = input[1] as! Point
		
		if point1 == point2 {
			result = []
			return
		}
		
		if (true) {
			var res: Node
			res = Line(a: point1, b: point2)
			result.append(res)
		}
	}
}
