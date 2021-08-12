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

//	let t1 = Segment(a: a, b: b)
//	let t2 = Segment(a: b, b: a)
//	print(t1.name, t1.dataType, t2.name, t2.dataType)
//	print(t1.hashValue, t2.hashValue)

	let ab = Segment(a: a, b: b, length: LinearUnit.new(value: 10))
	let bc = Segment(a: b, b: c, length: LinearUnit.new(value: 15))
	let ca = Segment(a: c, b: a, length: LinearUnit.new(value: 20))

	nodeRegistry.add(instances: ab, bc, ca)

	let de = Segment(a: d, b: e, length: LinearUnit.new(value: 10))
	let ef = Segment(a: e, b: f, length: LinearUnit.new(value: 15))
	let fd = Segment(a: f, b: d, length: LinearUnit.new(value: 20))

	nodeRegistry.add(instances: de, ef, fd)

	let task = Task(task: BEPolygonEquality(left: Triangle(vertexes: [a, b, c]), right: Triangle(vertexes: [d, e, f]), leftShift: Shift()))

	taskRegistry.add(instances: task)

}
