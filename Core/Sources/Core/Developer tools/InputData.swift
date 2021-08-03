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

	let a = Point(name: "A")
	let b = Point(name: "B")
	let c = Point(name: "C")
	let d = Point(name: "D")
	let e = Point(name: "E")
	let f = Point(name: "F")

	nodeRegistry.add(instances: a, b, c, d, e, f)

	let ab = Segment(a: a, b: b, length: LinearUnit.new(value: 10))
	let bc = Segment(a: b, b: c, length: LinearUnit.new(value: 15))
	let ca = Segment(a: c, b: a, length: LinearUnit.new(value: 20))

	nodeRegistry.add(instances: ab, bc, ca)

	let de = Segment(a: d, b: e, length: LinearUnit.new(value: 10))
	let ef = Segment(a: e, b: f, length: LinearUnit.new(value: 15))
	let fd = Segment(a: f, b: d, length: LinearUnit.new(value: 20))

	nodeRegistry.add(instances: de, ef, fd)

	let task = Task(task: BEEquality(left: Triangle(vertexes: [a, b, c]), right: Triangle(vertexes: [d, e, f])))

	taskRegistry.add(instances: task)

}
