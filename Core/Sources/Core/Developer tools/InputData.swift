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

	// MARK: tests

	let a = Point(name: "A", isInput: true)
	let c = Point(name: "C", isInput: true)

	nodeRegistry.add(instances: a, c)

//	let a1 = Point(name: "A1", isInput: true)
//	let b1 = Point(name: "B1", isInput: true)
//	let c1 = Point(name: "C1", isInput: true)
//	let d1 = Point(name: "D1", isInput: true)

//	let ab = Segment(a: a, b: b)
//	let cd = Segment(a: c, b: d)
//
//	let ab1 = Segment(a: a1, b: b1)
//	let cd1 = Segment(a: c1, b: d1)

//	let equal_ab_cd = BEEquality(left: ab, right: cd)
//	let equal_ab1_cd1 = BEEquality(left: ab1, right: cd1)
//	let equal_ab_ab1 = BEEquality(left: ab, right: ab1)

//	nodeRegistry.add(instances: equal_ab_cd, equal_ab1_cd1, equal_ab_ab1)
	
	// MARK: add input data
	
//	let a = Point(name: "A", isInput: true)
//	let b = Point(name: "B", isInput: true)
//	let c = Point(name: "C", isInput: true)
//	let d = Point(name: "D", isInput: true)
//
//	nodeRegistry.add(instances: a, b, c, d)
//
//	let ab = Segment(a: a, b: b, length: LengthValue.new(value: 5), isInput: true)
//	let bc = Segment(a: b, b: c, length: LengthValue.new(value: 10), isInput: true)
//	let cd = Segment(a: c, b: d, length: LengthValue.new(value: 10), isInput: true)
//	let ad = Segment(a: a, b: d, length: LengthValue.new(value: 5), isInput: true)
//
//	nodeRegistry.add(instances: ab, bc, cd, ad)
//
//	let abc = Triangle(vertexes: [a, b, c], isInput: true)
//
//	let acd = Triangle(vertexes: [a, c, d], isInput: true)
//
//	nodeRegistry.add(instances: abc, acd)
//
	// MARK: add tasks
//
//	let e = BEPolygonEquality(left: abc, right: acd, leftShift: Shift(2, reversed: true))
//
//	let task = Task(name: "Equality", task: e)
//
//	taskRegistry.add(instances: task)
}
