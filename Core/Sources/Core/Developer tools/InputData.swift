//
//  InputData.swift
//  
//
//  Created by Daniel Pustotin on 04.04.2021.
//

import Foundation

import Math

@available(iOS 10.0, *)
public func loadInputData() {

	let line = Line(name: "a")

	line.insertPoint(Point(name: "A"))
	line.insertPoint(Point(name: "C"), after: Point(name: "A"))
	line.insertPoint(Point(name: "B"), after: Point(name: "A"))
	line.insertPoint(Point(name: "D"), after: Point(name: "B"))

	nodeRegistry.add(instances: line)
}
