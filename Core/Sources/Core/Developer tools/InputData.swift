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

	let a1 = Point(name: "A1")
	let b1 = Point(name: "B1")
	let c1 = Point(name: "C1")
	let d1 = Point(name: "D1")
	let e1 = Point(name: "E1")
	let f1 = Point(name: "F1")

	let a2 = Point(name: "A2")
	let b2 = Point(name: "B2")
	let c2 = Point(name: "C2")
	let d2 = Point(name: "D2")
	let e2 = Point(name: "E2")
	let f2 = Point(name: "F2")

	let a3 = Point(name: "A3")
	let b3 = Point(name: "B3")
	let c3 = Point(name: "C3")
	let d3 = Point(name: "D3")
	let e3 = Point(name: "E3")
	let f3 = Point(name: "F3")

	nodeRegistry.add(instances: a1, b1, c1, d1, e1, f1)
	nodeRegistry.add(instances: a2, b2, c2, d2, e2, f2)
	nodeRegistry.add(instances: a3, b3, c3, d3, e3, f3)

	// SSS

	let ab1 = Segment(a: a1, b: b1, length: LinearUnit.new(value: 10))
	let bc1 = Segment(a: b1, b: c1, length: LinearUnit.new(value: 15))
	let ca1 = Segment(a: c1, b: a1, length: LinearUnit.new(value: 20))

	let triangleABC1 = Triangle(vertexes: [a1, b1, c1])

	nodeRegistry.add(instances: ab1, bc1, ca1, triangleABC1)

	let de1 = Segment(a: d1, b: e1, length: LinearUnit.new(value: 10))
	let ef1 = Segment(a: e1, b: f1, length: LinearUnit.new(value: 15))
	let fd1 = Segment(a: f1, b: d1, length: LinearUnit.new(value: 20))

	let triangleDEF1 = Triangle(vertexes: [d1, e1, f1])

	nodeRegistry.add(instances: de1, ef1, fd1, triangleDEF1)

	// SAS

	let ab2 = Segment(a: a2, b: b2, length: LinearUnit.new(value: 10))
	let ca2 = Segment(a: c2, b: a2, length: LinearUnit.new(value: 20))
	let bac2 = Angle(a: b2, b: a2, c: c2, value: AngularUnit.new(value: 60))

	let triangleABC2 = Triangle(vertexes: [a2, b2, c2])

	nodeRegistry.add(instances: ab2, ca2, bac2, triangleABC2)

	let de2 = Segment(a: d2, b: e2, length: LinearUnit.new(value: 10))
	let fd2 = Segment(a: f2, b: d2, length: LinearUnit.new(value: 20))
	let edf2 = Angle(a: e2, b: d2, c: f2, value: AngularUnit.new(value: 60))

	let triangleDEF2 = Triangle(vertexes: [d2, e2, f2])

	nodeRegistry.add(instances: de2, fd2, edf2, triangleDEF2)

	// ASA

	let ab3 = Segment(a: a3, b: b3, length: LinearUnit.new(value: 10))
	let bac3 = Angle(a: b3, b: a3, c: c3, value: AngularUnit.new(value: 60))
	let abc3 = Angle(a: a3, b: b3, c: c3, value: AngularUnit.new(value: 30))

	let triangleABC3 = Triangle(vertexes: [a3, b3, c3])

	nodeRegistry.add(instances: ab3, bac3, abc3, triangleABC3)

	let de3 = Segment(a: d3, b: e3, length: LinearUnit.new(value: 10))
	let edf3 = Angle(a: e3, b: d3, c: f3, value: AngularUnit.new(value: 60))
	let def3 = Angle(a: d3, b: e3, c: f3, value: AngularUnit.new(value: 30))

	let triangleDEF3 = Triangle(vertexes: [d3, e3, f3])

	nodeRegistry.add(instances: de3, edf3, def3, triangleDEF3)

	let taskSSS = Task(task: BEPolygonEquality(left: triangleABC1, right: triangleDEF1, leftShift: Shift()))
	let taskSAS = Task(task: BEPolygonEquality(left: triangleABC2, right: triangleDEF2, leftShift: Shift()))
	let taskASA = Task(task: BEPolygonEquality(left: triangleABC3, right: triangleDEF3, leftShift: Shift()))

	taskRegistry.add(instances: taskSSS, taskSAS, taskASA)

}
